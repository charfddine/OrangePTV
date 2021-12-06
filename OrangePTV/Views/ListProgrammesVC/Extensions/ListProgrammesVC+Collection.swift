//
//  ListProgrammesVC+Collection.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import UIKit

extension ListProgrammesVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch UIDevice.current.userInterfaceIdiom {
          case .phone:
            return CGSize(width: (collectionView.frame.width/3) - 7, height: collectionView.frame.height/3)
          case .pad:
            return CGSize(width: (collectionView.frame.width/4) - 10, height: collectionView.frame.height/3)
        case .tv:
            return CGSize(width: (collectionView.frame.width/7) - 25, height: collectionView.frame.height/4)
        case .unspecified:
            return CGSize(width: (collectionView.frame.width/2) - 5, height: collectionView.frame.height/2)
        case .carPlay:
            return CGSize(width: (collectionView.frame.width/6) - 15, height: collectionView.frame.height/4)
        case .mac:
            return CGSize(width: (collectionView.frame.width/6) - 25, height: collectionView.frame.height/4)
        @unknown default:
            return CGSize(width: (collectionView.frame.width/2) - 5, height: collectionView.frame.height/2)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedProgramme.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ProgrammeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgrammeCellID", for: indexPath) as! ProgrammeCell
        cell.Programme = searchedProgramme[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        endEditingSearchBar()
    }
    
}
