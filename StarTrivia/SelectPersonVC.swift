//
//  ViewController.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/09/29.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personApi.getRandomPersonUrlSession()
    }


}

