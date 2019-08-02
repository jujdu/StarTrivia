//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Michael Sidoruk on 01/08/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var crawlLbl: UITextView!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var person: Person!
    let filmAPI = FilmAPI()
    var films = [String]()
    var currentFilm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.filmUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        
        guard let firstFilm = films.first else { return }
        getFilm(url: firstFilm)
    }

    func getFilm(url: String) {
        filmAPI.getFilm(url: url) { (film) in
            guard let film = film else { return }
            self.setupView(film: film)
        }
    }
    
    func setupView(film: Film) {
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releasedLbl.text = film.releaseDate
        let stripped = film.crawl.replacingOccurrences(of: "\n", with: "")
        crawlLbl.text = stripped.replacingOccurrences(of: "\r", with: "")
    }
    
    func setBtnState() {
        previousBtn.isEnabled = currentFilm == 0 ? false : true
        nextBtn.isEnabled = currentFilm == films.count - 1 ? false : true
        getFilm(url: films[currentFilm])
    }
    
    @IBAction func previousPressed(_ sender: Any) {
        currentFilm -= 1
        setBtnState()
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        currentFilm += 1
        setBtnState()
    }

}
