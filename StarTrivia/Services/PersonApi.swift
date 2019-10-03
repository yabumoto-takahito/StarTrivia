//
//  PersonApi.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/10/03.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import Foundation

class PersonApi {
    
    func getRandomPersonUrlSession() {
        
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
                print(json)
                
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        // リクエストを実行
        task.resume()
    }
}