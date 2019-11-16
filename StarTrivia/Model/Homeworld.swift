//
//  Homeworld.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/11/16.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import Foundation

// Homeworldの定義
struct Homeworld: Codable {
    let name: String
    let climate: String
    let terrain: String
    let population: String
}
