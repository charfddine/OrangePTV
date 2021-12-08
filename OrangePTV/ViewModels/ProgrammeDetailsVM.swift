//
//  ProgrammeDetailsVM.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import Combine

protocol ProgrammeDetailsVMProtocol{
    var programmeMD : ProgrammeModelDetails? { get set }
}

final class ProgrammeDetailsVM {
    
    var delegate : ProgrammeDetailsVMProtocol?
    let title = "Details Of Program"
    var coordinator : ProgrammeDetailsCoordinator?
    private var observer : AnyCancellable?
    private let programmeService : ProgrammeServiceProtocol
    
    init(programmeService: ProgrammeServiceProtocol = ProgrammeServices()) {
        self.programmeService = programmeService
    }
    
    func closeAction(){
        coordinator?.close()
    }

    func getPitch(programM: ProgrammeModel){
        observer = programmeService.getPitch(detailLink: apiUrl + (programM.detaillink ?? ""))
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion{
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] value in
                self?.delegate?.programmeMD = ProgrammeModelDetails(programmeModel: programM, pitch: value)
        }
    }
}
