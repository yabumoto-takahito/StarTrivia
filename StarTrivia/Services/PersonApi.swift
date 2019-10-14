//
//  PersonApi.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/10/03.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonApi {
    
    // Web Request with Alamofire and Codable
    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        AF.request(url).responseJSON { (response) in
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
//    // Web Request with Alamofire and SwiftyJson
//    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
//        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
//        AF.request(url).responseJSON { (response) in
//            switch response.result {
//                case .success:
//                    let json = JSON(response.data as Any)
//                    let person = self.parsePersonSwifty(json: json)
//                    completion(person)
//
//                case .failure(let error):
//                    debugPrint(error.localizedDescription)
//                    completion(nil)
//            }
//        }
//    }
    
    // Web Request with URL Session
    func getRandomPersonUrlSession(id: Int, completion: @escaping PersonResponseCompletion) {
    // guard let：これ以上処理を進めたくない場合に使用。
    // nilが入っていたらエラーとして扱う場合によく使う。
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        
    // dataTask(with:completionHandler:)
    // 渡したリクエストを非同期で実行する。読み込みが完了するとcompletionHandlerが実行される
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // レスポンスに対する処理をここで行う（コールバック関数）
            // task.resume() を実行するとリクエストが行われ、
            // レスポンスが返ってきた時点でここの処理が非同期で行われる
            
            // errorがnilであることを確認
            guard error == nil else {
                debugPrint(error.debugDescription)
                // 渡されたクロージャを実行
                completion(nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                // 型がData型になっているので、JSONに変換
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                // 型を[String: Any]としてキャスト
                guard let json = jsonAny as? [String: Any] else { return }
                let person = self.parsePersonManual(json: json)
                DispatchQueue.main.async {
                    // 渡されたクロージャを実行
                    completion(person)
                }
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        // リクエストを実行
        task.resume()
    }
    
    // Parsing with SwiftyJson
    private func parsePersonSwifty(json: JSON) -> Person {
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair = json["hair_color"].stringValue
        let birthYear = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeWorldUrl = json["homeworld"].stringValue
        let filmUrls = json["films"].arrayValue.map({$0.stringValue})
        let vehicleUrls = json["vehicles"].arrayValue.map({$0.stringValue})
        let starshipUrls = json["starships"].arrayValue.map({$0.stringValue})
        
        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeWorldUrl: homeWorldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
    }
    
    // Parsing function using manual methods
    // [String:Any]：Stringをキーにしてデータはどんな型でも入れることができる
    private func parsePersonManual(json: [String: Any]) -> Person {
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeWorldUrl = json["homeworld"] as? String ?? ""
        let filmUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
        let starshipUrls = json["starships"] as? [String] ?? [String]()
        
        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeWorldUrl: homeWorldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
    }
}
