//
//  ViewController.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/09/29.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    
    
    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //step 1: make networking request
        personApi.getRandomPersonUrlSession { (person) in
            if let person = person {
                print(person.name)
            }
        }
        //
    }


}

