//
//  ProgrammeModel.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation

struct Title : Decodable{
    let type : String?
    let value : String?
}

struct Playinfoid : Decodable{
    let hd : String?
    let sd : String?
}

struct ProgrammeModel : Decodable{
    let title : [Title]?
    let subtitle : String?
    let imageurl : String?
    let fullscreenimageurl : String?
    let id : String?
    let detaillink : String?
    let duration : String?
    var playinfoid : Playinfoid?
}


