//
//  ListProgrammeModel.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation

struct ListProgrammesModel : Decodable{
    
    let title : String?
    var contents : [ProgrammeModel]?

}
