//
//  ListProgrammesVC+SearchBar.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import UIKit

extension ListProgrammesVC : UISearchBarDelegate,UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("did change")
        self.viewModel?.getSearchedListProgrammes(searchTxt: searchText)
    }
        
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        endEditingSearchBar()
    }
    
    func endEditingSearchBar(){
        searchBar.endEditing(true)
    }
    
}
