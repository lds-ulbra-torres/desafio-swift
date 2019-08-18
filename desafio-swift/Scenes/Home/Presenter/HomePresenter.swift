//
//  HomePresenter.swift
//  desafio-swift
//
//  Created by Arthur Rocha on 17/08/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

protocol HomeViewPresenterDelegate: AnyObject {
    func didEnterPerson(person: Person)
}

class HomePresenter {
    let service: PersonService
    var view: HomeView
    weak var delegate: HomeViewPresenterDelegate?
    
    var people: [Person] = []
    
    init(service: PersonService,
         view: HomeView,
         delegate: HomeViewPresenterDelegate?) {
        self.service = service
        self.view = view
        self.delegate = delegate
    }
    
    func present() {
        view.startLoading()
        service.fetchAll { [weak self] (response, error) in
            self?.view.stopLoading()
            self?.view.hideMessage()
            guard let people = response?.results else {
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
            self?.people = people
            self?.view.reloadData()
        }
    }
    
    func didSelect(row: Int) {
        delegate?.didEnterPerson(person: people[row])
    }
}
