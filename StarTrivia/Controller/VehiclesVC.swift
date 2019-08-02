//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Michael Sidoruk on 01/08/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufacturerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!
    let vehicleAPI = VehicleAPI()
    var vehicles = [String]()
    var currentVehicle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrl
        previousBtn.isEnabled = false
        nextBtn.isEnabled = vehicles.count > 1
        
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
    }
    
    func getVehicle(url: String) {
        vehicleAPI.getVehicle(url: url) { (vehicle) in
            guard let vehicle = vehicle else { return }
            self.setupView(vehicle: vehicle)
        }
    }
    
    func setupView(vehicle: Vehicle) {
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        manufacturerLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        lengthLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        passengersLbl.text = vehicle.passengers
    }
    
    func setBtnState() {
        
        nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        previousBtn.isEnabled = currentVehicle == 0 ? false : true
//        if currentVehicle == 0 {
//            previousBtn.isEnabled = false
//        } else {
//            previousBtn.isEnabled = true
//        }
//
//        if currentVehicle == vehicles.count - 1 {
//            nextBtn.isEnabled = false
//        } else {
//            nextBtn.isEnabled = true
//        }
        
        getVehicle(url: vehicles[currentVehicle])
    }
    
    @IBAction func previousPressed(_ sender: Any) {
        currentVehicle -= 1
        setBtnState()
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        currentVehicle += 1
        setBtnState()
    }
    
}
