//
//  AppCoordinator.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get}
    func start()
}

final class AppCoordinator : Coordinator{
    
    var childCoordinators: [Coordinator] = []
    private let window : UIWindow
    
    init(window : UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController : UINavigationController = UINavigationController(nibName: nil, bundle: .main)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
        let splashC = SplashCoordinator(navigationController: navigationController)
        childCoordinators.append(splashC)
        splashC.start()
    }
    
}
