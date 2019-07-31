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

    var personAPI = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func randomPressed(_ sender: Any) {
        let random = Int.random(in: 1...87)
        personAPI.getRandomPersonAlamofire(id: random) { (person) in
            guard let person = person else { return }
            self.nameLbl.text = person.name
            self.heightLbl.text = person.height
            self.massLbl.text = person.mass
            self.hairLbl.text = person.hair
            self.birthYearLbl.text = person.birthYear
            self.genderLbl.text = person.gender
        }
    }
}

