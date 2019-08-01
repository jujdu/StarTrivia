//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Michael Sidoruk on 30/07/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonAPI {
    
    // Web request with Alamofire and Codable
    func getRandomPersonAlamofire(id: Int, completion: @escaping PersonResponseCompletion) {
        guard let url = URL(string: "\(PERSON_URL)\(1)") else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
            let jsonDecoder = JSONDecoder()
            do {
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    // Web request with Alamofire and SwiftyJSON
//    func getRandomPersonAlamofire(id: Int, completion: @escaping PersonResponseComplition) {
//        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
//        Alamofire.request(url).responseJSON { (response) in
//            if let error = response.result.error {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//                return
//            }
//
//            guard let data = response.data else { return completion(nil)}
//
//            do {
//                let json = try JSON(data: data)
//                let person = self.parsePersonSwiftyJSON(json: json)
//                completion(person)
//            } catch {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//            }
//        }
//    }
    
    // Web Request with Alamofire
//    func getRandomPersonAlamofire(id: Int, completion: @escaping PersonResponseComplition) {
//        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
//        Alamofire.request(url).responseJSON { (response) in
//            if let error = response.result.error {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//                return
//            }
//
//            guard let json = response.result.value as? [String: Any] else { return completion(nil)}
//            let person = self.parsePersonManual(json: json)
//            completion(person)
//        }
//    }
    
    
    // Web Request with URL Session
    func getRandomPersonUrlSession(id: Int, completion: @escaping PersonResponseCompletion) {
    
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else { return }
                let person = self.parsePersonManual(json: json)
                DispatchQueue.main.async {
                    completion(person)
                }
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
            
        }
        task.resume()
    }
    
    //Parse witj SwiftyJSON
    private func parsePersonSwiftyJSON(json: JSON) -> Person {
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair = json["hair_color"].stringValue
        let birthYear = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeworldUrl = json["homeworld"].stringValue
        let filmsUrls = json["films"].arrayValue.map({$0.stringValue})
        let vehicleUrl = json["vehicles"].arrayValue.map({$0.stringValue})
        let starshipUrls = json["starships"].arrayValue.map({$0.stringValue})
        
        let person = Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmsUrls, vehicleUrl: vehicleUrl, starshipUrl: starshipUrls)
        return person
    }
    
    //Parse JSON manually
    private func parsePersonManual(json: [String: Any]) -> Person {
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworldUrl = json["homeworld"] as? String ?? ""
        let filmsUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrl = json["vehicles"] as? [String] ?? [String]()
        let starshipUrls = json["starships"] as? [String] ?? [String]()
        
        let person = Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmsUrls, vehicleUrl: vehicleUrl, starshipUrl: starshipUrls)
        return person
    }
}
