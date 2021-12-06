//
//  ProgrammeService.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import Combine

final class ProgrammeServices : ProgrammeServiceProtocol{

    // MARK: Récupération de la liste des programmes chercher
    func getData<T>(urlString : String)-> AnyPublisher<T,Error> where T : Codable{
        guard let url = URL(string: urlString) else { return Empty(completeImmediately: false).eraseToAnyPublisher() }
        return  URLSession.shared.dataTaskPublisher(for : url).map{ a in
            return a.data
        }
        .decode(type: T.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .mapError({ _ in  AppError.invalidData })
        .eraseToAnyPublisher()
    }
    
}
