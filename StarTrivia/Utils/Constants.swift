//
//  Constants.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/10/02.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.co/api/"
let PERSON_URL = URL_BASE + "people/"

//型エイリアス
typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeworldResponseCompletion = (Homeworld?) -> Void
typealias VehicleResponseCompletion = (Vehicle?) -> Void
