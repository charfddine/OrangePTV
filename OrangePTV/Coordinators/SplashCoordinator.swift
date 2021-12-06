//
//  SplashCoordinator.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import UIKit

final class SplashCoordinator : Coordinator{
    
    var childCoordinators: [Coordinator] = []
    private let navigationController : UINavigationController?
    
    init(navigationController : UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let splashVController : SplashViewController = SplashViewController.instantiate()
        self.navigationController?.setViewControllers([splashVController], animated: true)
    }
    
    func goToListProgrammes(){
        let plistProgrammesController : ListProgrammesVC = ListProgrammesVC.instantiate(programmeViewModel: ListProgrammesVM())
        self.navigationController?.pushViewController(plistProgrammesController, animated: true)
    }
    
}
