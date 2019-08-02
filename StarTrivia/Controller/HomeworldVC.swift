//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Michael Sidoruk on 01/08/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var homeworldAPI = HomeworldAPI()
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
        homeworldAPI.getHomeworld(url: person.homeworldUrl) { (homeworld) in
            self.spinner.stopAnimating()
            guard let homeworld = homeworld else { return }
            self.setupView(homeworld: homeworld)
        }
    }
    
    func setupView(homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
}
