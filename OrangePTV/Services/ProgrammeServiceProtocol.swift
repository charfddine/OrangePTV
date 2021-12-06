//
//  ProgrammeServiceProtocol.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import Combine

protocol ProgrammeServiceProtocol {
    func getData<T:Decodable>(urlString : String)-> AnyPublisher<T,Error>
    func getPitch(pitchUrl : String)-> AnyPublisher<String,Error>
}

