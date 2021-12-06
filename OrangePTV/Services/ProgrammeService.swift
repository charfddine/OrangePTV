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
    
    // MARK: Récupération du Pitch pour un film ou une serie
    func getPitch(detailLink : String)-> AnyPublisher<String, Error>{
        guard let url = URL(string: detailLink) else { return Empty(completeImmediately: false).eraseToAnyPublisher() }
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { $0 as Error }
            .map {
                (data, response) in
                let object = try? JSONSerialization.jsonObject(
                    with: data,
                    options: []
                )
                let nsDict = object as? NSDictionary
                var pitch : String = ""
                let contentDic = nsDict?.object(forKey: "contents")
                
                if  contentDic != nil {
                    if (contentDic as! NSDictionary).object(forKey:"pitch") != nil{
                        pitch = (contentDic as! NSDictionary).object(forKey:"pitch") as! String
                    }else{
                        let firstSeason = ((contentDic as! NSDictionary).object(forKey:"seasons") as! Array<NSDictionary>) [0]
                        pitch = firstSeason.object(forKey: "pitch") as! String
                    }
                }
                return pitch
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
