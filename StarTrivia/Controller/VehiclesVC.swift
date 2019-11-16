//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/10/23.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        
    }
}
