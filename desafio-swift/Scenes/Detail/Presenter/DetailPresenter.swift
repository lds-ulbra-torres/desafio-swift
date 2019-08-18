//
//  DetailPresenter.swift
//  desafio-swift
//
//  Created by Arthur Rocha on 17/08/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

class DetailPresenter {
    let service: PersonService
    var view: DetailView
    var person: Person?
    
    init(service: PersonService,
         view: DetailView,
         person: Person?) {
        self.service = service
        self.view = view
        self.person = person
    }
    
    func present() {
        guard let person = person else {
            fatalError("Error in Injection Object: [Person]")
        }
        view.displayView(title: person.name)
        
        view.startLoading()
        service.fetchId(person: person) { [weak self] (response, error) in
            self?.view.stopLoading()
            self?.view.hideMessage()
            guard let person = response else {
                switch error {
                case .unauthorized(let message):
                    self?.view.showMessage(icon: .notFound, text: message, sizeIcon: 50, backgroundColor: .white, isButton: false, titleButton: "")
                case .error(let message), .notFound(let message), .parseError(let message), .badRequest(let message):
                    self?.view.showMessage(icon: .notFound, text: message, sizeIcon: 50, backgroundColor: .white, isButton: false, titleButton: "")
                case .noConnection(let message):
                    self?.view.showMessage(icon: .notFound, text: message, sizeIcon: 50, backgroundColor: .white, isButton: false, titleButton: "")
                case .none(_): break
                }
                return
            }
            self?.view.displayView(height: person.height)
            self?.view.displayView(mass: person.mass)
            self?.view.displayView(hair: person.hairColor)
            self?.view.displayView(skin: person.skinColor)
            self?.view.displayView(eye: person.eyeColor)
            self?.view.displayView(birthYear: person.birthYear)
            self?.view.displayView(gender: person.gender)
            self?.view.displayView(films: person.films.count.toString())
            self?.view.displayView(species: person.species.count.toString())
            self?.view.displayView(vehicles: person.vehicles.count.toString())
            self?.view.displayView(starships: person.starships.count.toString())
        }
    }
}
