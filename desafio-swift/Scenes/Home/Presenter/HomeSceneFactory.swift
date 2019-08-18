//
//  HomeSceneFactory.swift
//  desafio-swift
//
//  Created by Arthur Rocha on 17/08/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit
import Foundation

struct HomeSceneFactory {
    static func makeHomeScene(delegate: HomeViewPresenterDelegate?) -> HomeController {
        let viewController = HomeController()
        let service = PersonService()
        let presenter = HomePresenter(service: service, view: viewController, delegate: delegate)
        viewController.presenter = presenter
        return viewController
    }
    
    static func makeDetailScene(person: Person) -> DetailController {
        let viewController = DetailController()
        let service = PersonService()
        let presenter = DetailPresenter(service: service, view: viewController, person: person)
        viewController.presenter = presenter
        return viewController
    }
}
