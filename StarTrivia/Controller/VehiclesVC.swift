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
    let vehicleApi = VehicleApi()
    var vehicles = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrls
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
    }
    
    func getVehicle(url: String) {
        vehicleApi.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setupUi(vehicle: vehicle)
            }
        }
    }
    
    func setupUi(vehicle: Vehicle) {
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        makerLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        lengthLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        passengersLbl.text = vehicle.passengers
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        
    }
}
