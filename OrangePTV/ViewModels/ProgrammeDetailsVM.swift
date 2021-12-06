//
//  ProgrammeDetailsVM.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import Combine

final class ProgrammeDetailsVM : ObservableObject{
    
    let title = "Details Of Program"
    var coordinator : ProgrammeDetailsCoordinator?
    var programme : ProgrammeModelDetails?
    private var observer : AnyCancellable?
    private let programmeService : ProgrammeServiceProtocol
    
    init(programmeService: ProgrammeServiceProtocol = ProgrammeServices()) {
        self.programmeService = programmeService
    }
    
    func closeAction(){
        coordinator?.close()
    }
    
    func getPitch(programM: ProgrammeModel){
        observer = programmeService.getPitch(pitchUrl: programM.detaillink ?? "")
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion{
                case .finished:
                    print("finished")
                    NotificationCenter.default.post(name: Notification.Name.init("PitchIsLoaded"), object: nil)
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] value in
                self?.programme = ProgrammeModelDetails(programmeModel: programM, pitch: value)
                print(value)
        }
    }
    
}
