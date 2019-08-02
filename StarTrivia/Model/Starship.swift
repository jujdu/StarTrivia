//
//  Starship.swift
//  StarTrivia
//
//  Created by Michael Sidoruk on 02/08/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation

struct Starship: Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let speed: String
    let crew: String
    let passengers: String
    //TODO: скопировать UI с vehicle UI, анбэднуть view добавить эти 3 лейбла + скопироватть кнопки
    let capacity: String
    let starshipClass: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
        case capacity = "cargo_capacity"
        case starshipClass = "starship_class"
    }
}
