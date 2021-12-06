//
//  ProgrammeListCoordinator.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import UIKit

final class ProgrammeListCoordinator : Coordinator{
    
    var childCoordinators: [Coordinator] = []
    private let navigationController : UINavigationController?
    
    init(navigationController : UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ListProgrammesVM()
        viewModel.coordinator = self
        let programmeListController : ListProgrammesVC = ListProgrammesVC.instantiate(programmeViewModel: viewModel)
        self.navigationController?.setViewControllers([programmeListController], animated: true)
    }
    
}
