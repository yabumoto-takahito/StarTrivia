//
//  Vehicle.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/11/16.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import Foundation

// Vehiclesの定義
struct Vehicle: Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let speed: String
    let crew: String
    let passengers: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
    }
}
