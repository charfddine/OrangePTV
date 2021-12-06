//
//  ListProgrammesVM.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import Combine
import UIKit

final class ListProgrammesVM {
    
    let title = "List of Programs"
    var listProgrammes : [ProgrammeModel]?
    private var observer : AnyCancellable?
    var coordinator : ProgrammeListCoordinator? = nil
    private let programmeService : ProgrammeServiceProtocol
    
    init(programmeService: ProgrammeServiceProtocol = ProgrammeServices()) {
        self.programmeService = programmeService
    }
    
    func tappedAtProgramme(){
        coordinator?.start()
    }
    
    func getSearchedListProgrammes(searchTxt : String){
        
        let urlString = searchUrl + searchTxt.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        observer = programmeService.getData(urlString: urlString).sink(receiveCompletion: {
            completion in
                switch completion{
                case .finished:
                    print("finished")
                    NotificationCenter.default.post(name: Notification.Name.init("ListIsReloaded"), object: nil)
                case .failure(let error):
                    print(error)
                }
        },receiveValue: { [weak self] (value : ListProgrammesModel) in
            self?.listProgrammes = value.contents
        })
            
    }
    
}
