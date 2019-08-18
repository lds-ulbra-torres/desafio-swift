//
//  HomeCoordinator.swift
//  desafio-swift
//
//  Created by Arthur Rocha on 17/08/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit
import Foundation

class HomeCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        showHomeScene()
    }
}

extension HomeCoordinator {
    func showHomeScene() {
        let scene = HomeSceneFactory.makeHomeScene(delegate: self)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.viewControllers = [scene]
    }
    
    func showDetailScene(person: Person) {
        let scene = HomeSceneFactory.makeDetailScene(person: person)
        navigationController.pushViewController(scene, animated: true)
    }
}

extension HomeCoordinator: HomeViewPresenterDelegate {
    func didEnterPerson(person: Person) {
        showDetailScene(person: person)
    }
}
