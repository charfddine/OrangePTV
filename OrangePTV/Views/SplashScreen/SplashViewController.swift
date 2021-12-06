//
//  ViewController.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import UIKit

class SplashViewController : UIViewController {
    
    static func instantiate()-> SplashViewController{
        let storyBoard = UIStoryboard.init(name: "Main", bundle: .main)
        let SplashVC : SplashViewController = storyBoard.instantiateViewController(identifier: "SplashVC")
        return SplashVC
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            SplashCoordinator.init(navigationController: self.navigationController!).goToListProgrammes()
        }
    }
}
