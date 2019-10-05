//
//  PersonApi.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/10/03.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import Foundation

class PersonApi {
    
    func getRandomPersonUrlSession() -> Person {
        
//      guard let：これ以上処理を進めたくない場合に使用。
//      nilが入っていたらエラーとして扱う場合によく使う。
        guard let url = URL(string: PERSON_URL) else { return }
        
//      dataTask(with:completionHandler:)
//      渡したリクエストを非同期で実行する。読み込みが完了するとcompletionHandlerが実行される
        let task = URLSession.shared.dataTask(with: url) { (data, responce, error) in
            // レスポンスに対する処理をここで行う（コールバック関数）
            // task.resume() を実行するとリクエストが行われ、
            // レスポンスが返ってきた時点でここの処理が非同期で行われる
            
//          errorがnilであることを確認
            guard error == nil else {
                debugPrint(error.debugDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
//              型がData型になっているので、JSONに変換
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
//              型を[String: Any]としてキャスト
                guard let json = jsonAny as? [String: Any] else { return }
                let person = self.parsePersonManual(json: json)
                return person
                
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        // リクエストを実行
        task.resume()
    }
//  [String:Any]：Stringをキーにしてデータはどんな型でも入れることができる
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
