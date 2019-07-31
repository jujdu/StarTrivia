//
//  Constants.swift
//  StarTrivia
//
//  Created by Michael Sidoruk on 29/07/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.co/api/"
let PERSON_URL = URL_BASE + "people/"

typealias PersonResponseComplition = (Person?) -> ()
