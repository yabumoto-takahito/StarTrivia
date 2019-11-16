//
//  VehicleApi.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/11/16.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import Foundation
import Alamofire

class VehicleApi {
    
    func getVehicle(url: String, completion: @escaping VehicleResponseCompletion) {
        guard let url = URL(string: url) else { return }
        print(url)
        AF.request(url).responseJSON { (response) in
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let vehicle = try jsonDecoder.decode(Vehicle.self, from: data)
                completion(vehicle)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
