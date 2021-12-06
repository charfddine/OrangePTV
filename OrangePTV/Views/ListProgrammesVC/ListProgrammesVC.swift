//
//  ListProgrammesVC.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import UIKit
import Combine
import NotificationCenter

class ListProgrammesVC: UIViewController {
    
    var viewModel : ListProgrammesVM?
    var searchedProgramme : [ProgrammeModel] = []
    let searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.text = "Game"
        return searchBar
    }()

    private let HeaderImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "HeaderImg")
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 10
        return imgView
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ProgrammeCell.self, forCellWithReuseIdentifier: "ProgrammeCellID")
        return cv
    }()
    
    static func instantiate(programmeViewModel : ListProgrammesVM)-> ListProgrammesVC{
        let storyBoard = UIStoryboard.init(name: "Main", bundle: .main)
        let mediaListVC : ListProgrammesVC = storyBoard.instantiateViewController(identifier: "ListProgrammesVC")
        mediaListVC.viewModel = programmeViewModel
        return mediaListVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchedProgramme = self.viewModel?.listProgrammes ?? []
        setupViews()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.viewModel?.getSearchedListProgrammes(searchTxt: searchBar.text ?? "")
    }
    
    @objc private func methodOfReceivedNotification(notification: NSNotification) {
        DispatchQueue.main.async {
            self.searchedProgramme = self.viewModel?.listProgrammes ?? []
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
        NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification), name: Notification.Name.init("ListIsReloaded"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.init("ListIsReloaded"), object: nil)
    }
    
    private func setupViews() {
        collectionView.backgroundColor = .white
        self.view.backgroundColor = .white
        searchBar.delegate = self
        searchBar.tintColor = .black
        searchBar.barTintColor = .white
        searchBar.backgroundColor = .white
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.searchTextField.delegate = self
        searchBar.searchTextField.returnKeyType = .done
        view.addSubview(HeaderImage)
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        HeaderImage.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200, enableInsets: false)
        searchBar.anchor(top: self.HeaderImage.bottomAnchor, left: self.view.leftAnchor, bottom: self.collectionView.topAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 5, paddingRight: 0, width: 0, height: 40, enableInsets: false)
        collectionView.anchor(top: self.searchBar.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 0, enableInsets: false)
    }

}
