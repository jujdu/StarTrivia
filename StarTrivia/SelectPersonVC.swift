//
//  ViewController.swift
//  StarTrivia
//
//  Created by Michael Sidoruk on 29/07/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehicleBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var personAPI = PersonAPI()
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomPressed(_ sender: Any) {
        let random = Int.random(in: 1...87)
        spinner.startAnimating()
        personAPI.getRandomPersonAlamofire(id: random) { (person) in
            self.spinner.stopAnimating()
            guard let person = person else { return }
            self.setupView(person: person)
            self.person = person
        }
    }
    
    func setupView(person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        homeworldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehicleBtn.isEnabled = !person.vehicleUrl.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrl.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
//        switch segue.identifier {
//        case Segue.homeworld.rawValue:
//            if let destination = segue.destination as? HomeworldVC {
//                destination.person = person
//            }
//        case Segue.vehicles.rawValue:
//            if let destination = segue.destination as? VehiclesVC {
//                destination.person = person
//            }
//        case Segue.starships.rawValue:
//            if let destination = segue.destination as? StarshipsVC {
//                destination.person = person
//            }
//        case Segue.film.rawValue:
//            if let destination = segue.destination as? FilmsVC {
//                destination.person = person
//            }
//        default:
//            break
//        }
    }
    
//    enum Segue: String {
//        case homeworld = "toHomeworld"
//        case vehicles = "toVehicles"
//        case starships = "toStarships"
//        case film = "toFilms"
//    }
}

protocol PersonProtocol {
    var person: Person! {get set}
}
