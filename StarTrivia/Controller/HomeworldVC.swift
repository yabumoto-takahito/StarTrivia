//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/10/23.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    var person: Person!
    let homeworldApi = HomeworldApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeworldApi.getHomeworld(url: person.homeWorldUrl) { (homeworld) in
            if let homeworld = homeworld {
                self.setupUi(homeworld: homeworld)
            }
        }

        // Do any additional setup after loading the view.
    }
    
    func setupUi(homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
}
