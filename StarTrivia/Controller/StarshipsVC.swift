//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Michael Sidoruk on 01/08/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var capacityLbl: UILabel!
    @IBOutlet weak var classLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!
    var starshipAPI = StarshipAPI()
    var starships = [String]()
    var currentStarship = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipUrl
        previousBtn.isEnabled = false
        nextBtn.isEnabled = starships.count > 1

        guard let firstStarship = starships.first else { return }
        getStarship(url: firstStarship)
    }
    
    func getStarship(url: String) {
        starshipAPI.getStarship(url: url) { (starship) in
            guard let starship = starship else { return }
            self.updateView(starship: starship)
        }
    }
    
    func updateView(starship: Starship) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.manufacturer
        costLbl.text = starship.cost
        lengthLbl.text = starship.length
        speedLbl.text = starship.speed
        crewLbl.text = starship.crew
        passengersLbl.text = starship.passengers
        capacityLbl.text = starship.capacity
        classLbl.text = starship.starshipClass
    }
    
    func setBtnState() {
        previousBtn.isEnabled = currentStarship == 0 ? false : true
        nextBtn.isEnabled = currentStarship == starships.count - 1 ? false : true
        getStarship(url: starships[currentStarship])
    }
    
    @IBAction func previousPressed(_ sender: Any) {
        currentStarship -= 1
        setBtnState()
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        currentStarship += 1
        setBtnState()
    }
    
    
}
