//
//  ProgrammeServiceProtocol.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import Combine

protocol ProgrammeServiceProtocol {
    func getData<T>(urlString : String)-> AnyPublisher<T,Error> where T : Codable
}

