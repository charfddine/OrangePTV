//
//  ListProgrammesVM.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import Combine
import UIKit

protocol ListProgrammesVMProtocol{
    var listProgrammes : [ProgrammeModel]? { get set}
}

final class ListProgrammesVM {
    
    var delegate : ListProgrammesVMProtocol?
    let title = "List of Programs"
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
                case .failure(let error):
                    print(error)
                }
        },receiveValue: { [weak self] (value : ListProgrammesModel) in
            self?.delegate?.listProgrammes = value.contents
        })
            
    }
    
}
