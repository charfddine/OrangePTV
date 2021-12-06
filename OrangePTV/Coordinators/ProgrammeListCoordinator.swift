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
    
    func goToProgrammeDetails(programme : ProgrammeModel){
        let programmeDetailVM = ProgrammeDetailsVM()
        programmeDetailVM.programme = ProgrammeModelDetails(programmeModel: programme, pitch: "")
        programmeDetailVM.getPitch(programM: programme)
        let programmeDetailsController : ProgrammeDetailsVC = ProgrammeDetailsVC.instantiate(programmeVM: programmeDetailVM,navigationVC : navigationController!)
        self.navigationController?.present(programmeDetailsController, animated: true, completion: nil)
    }
}
