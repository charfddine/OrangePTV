//
//  ProgrammeDetailsCoordinator.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import UIKit

final class ProgrammeDetailsCoordinator : Coordinator{
    
    var childCoordinators: [Coordinator] = []
    private let navigationController : UINavigationController?

    init(navigationController : UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let programme = ProgrammeDetailsVM()
        let programmeVC = ProgrammeDetailsVC.instantiate(programmeVM: programme, navigationVC: navigationController!)
        self.navigationController?.present(programmeVC, animated: true, completion: nil)
    }
    
    func close(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
