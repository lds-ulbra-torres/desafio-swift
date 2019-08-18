//
//  AppCoordinator.swift
//  desafio-swift
//
//  Created by Arthur Rocha on 17/08/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit
import Foundation

class AppCoordinator: Coordinator {
    private let window: UIWindow
    private let navigationController: UINavigationController
    var starterCoordinator: Coordinator?
    
    init(window: UIWindow = UIWindow(),
         navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        setupWindow()
        setupStarterCoordinator()
    }
    
    func setupWindow() {
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func setupStarterCoordinator() {
        starterCoordinator = HomeCoordinator(navigationController: navigationController)
    }
    
    func start() {
        starterCoordinator?.start()
    }
}
