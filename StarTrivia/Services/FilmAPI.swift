//
//  FilmAPI.swift
//  StarTrivia
//
//  Created by Michael Sidoruk on 02/08/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation
import Alamofire

class FilmAPI {
    func getFilm(url: String, completion: @escaping FilmResponseCompletion) {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else { return completion(nil)}
            let jsonDecoder = JSONDecoder()
            do {
                let film = try jsonDecoder.decode(Film.self, from: data)
                completion(film)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
