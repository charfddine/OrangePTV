//
//  ProgrammeServicesMock.swift
//  OrangePTVTests
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import Combine

@testable import OrangePTV

class ProgrammeServicesMock: ProgrammeServiceProtocol {
    
    func getData<T>(urlString: String) -> AnyPublisher<T, Error> where T : Codable{
        
        return Just(ListProgrammesModel(
                                        title: "title",
                                        contents: [
                                            ProgrammeModel(title: [Title(type: "text", value: "title")],
                                                       subtitle: "subtitle",
                                                       imageurl: "",
                                                       fullscreenimageurl: "",
                                                       id: "",
                                                       detaillink: "",
                                                       duration: "",
                                                       playinfoid: Playinfoid(hd: "", sd: "")),
                                            ProgrammeModel(title: [Title(type: "text", value: "title1")],
                                                           subtitle: "subtitle1",
                                                           imageurl: "",
                                                           fullscreenimageurl: "",
                                                           id: "",
                                                           detaillink: "",
                                                           duration: "",
                                                           playinfoid: Playinfoid(hd: "", sd: "")),
                                            ProgrammeModel(title: [Title(type: "text", value: "title2")],
                                                           subtitle: "subtitle2",
                                                           imageurl: "",
                                                           fullscreenimageurl: "",
                                                           id: "",
                                                           detaillink: "",
                                                           duration: "",
                                                           playinfoid: Playinfoid(hd: "", sd: ""))
                                        ]) as! T)
            .mapError({ _ in  AppError.invalidData })
            .eraseToAnyPublisher()
    }
    
    func getPitch(detailLink: String) -> AnyPublisher<String, Error> {
        return Just("This is my pitch")
            .mapError({ _ in  AppError.invalidData })
            .eraseToAnyPublisher()
    }

}
