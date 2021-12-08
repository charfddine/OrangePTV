//
//  ProgrammeDetailsVC.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class ProgrammeDetailsVC : UIViewController, ProgrammeDetailsVMProtocol{
    
    var programmeMD: ProgrammeModelDetails?{
        didSet{
            ProgramTitleLabel.text = programmeMD?.programmeModel.title?[0].value
            ProgramSubtitleLabel.text = programmeMD?.programmeModel.subtitle
            if programmeMD?.programmeModel.imageurl != "" {
                guard let imgUrl = programmeMD?.programmeModel.fullscreenimageurl else { return }
                ProgrammeImage.downloaded(from: apiImageUrl +  imgUrl)
            }else{
                ProgrammeImage.image = UIImage(named: "No_image_available.jpg")
            }
            self.ProgramPitch.text = self.programmeMD?.pitch
        }
    }
    
    var navigationViewC : UINavigationController?
    
    static func instantiate(programmeVM : ProgrammeDetailsVM,navigationVC: UINavigationController) -> ProgrammeDetailsVC{
            let storyBord = UIStoryboard(name: "Main", bundle: .main)
            let mediaVC = storyBord.instantiateViewController(identifier: "ProgrammeDetailsVC") as! ProgrammeDetailsVC
            mediaVC.navigationViewC = navigationVC
            mediaVC.viewModel = programmeVM
            return mediaVC
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.delegate = self
        setUpViews()
    }
    
    func setUpViews(){
        
        self.view.addSubview(ProgrammeImage)
        self.view.addSubview(ProgramTitleLabel)
        self.view.addSubview(ProgramSubtitleLabel)
        self.view.addSubview(ProgramPitch)
        self.view.addSubview(playBtn)
        self.view.addSubview(closeBtn)
        
        closeBtn.addTarget(self, action: #selector(closeActionBtn), for: .touchUpInside)
        playBtn.addTarget(self, action: #selector(playActionBtn), for: .touchUpInside)

        closeBtn.anchor(top: self.view.topAnchor, left: nil, bottom: nil, right: self.view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 40, height: 40, enableInsets: false)
        ProgrammeImage.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: self.view.frame.height/2, enableInsets: false)
        playBtn.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: -30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 60, height: 60, enableInsets: false, centerX: ProgrammeImage.centerXAnchor, centerY: ProgrammeImage.centerYAnchor)
        ProgramTitleLabel.anchor(top: ProgrammeImage.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: -20, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 40, enableInsets: false)
        ProgramSubtitleLabel.anchor(top: ProgramTitleLabel.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 40, enableInsets: false)
        ProgramPitch.anchor(top: ProgramSubtitleLabel.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 20, paddingRight: 10, width: 0, height: 0, enableInsets: false)
    }
    
    var viewModel : ProgrammeDetailsVM?
    
    
    private let ProgramTitleLabel : PaddingLabel = {
        let lbl = PaddingLabel()
        lbl.textColor = .white
        lbl.layer.cornerRadius = 12
        lbl.backgroundColor = .orange
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.padding(0, 0, 10, 10)
        lbl.clipsToBounds = true
        return lbl
    }()
    
    
    private let ProgramSubtitleLabel : PaddingLabel = {
        let lbl = PaddingLabel()
        lbl.textColor = .black
        lbl.layer.cornerRadius = 12
        lbl.backgroundColor = .lightGray
        lbl.padding(0, 0, 10, 10)
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.clipsToBounds = true
        return lbl
    }()

    private let ProgramPitch : UITextView =  {
        let label = UITextView()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.layer.cornerRadius = 12
        label.backgroundColor = .lightGray
        label.textAlignment = .left
        label.textColor = .black
        label.clipsToBounds = true
        return label
    }()
    
    private let ProgrammeImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let closeBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "close"), for: .normal)
        return btn
    }()
    
    private let playBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .white
        btn.setImage(UIImage(named: "playBtn"), for: .normal)
        btn.layer.cornerRadius = 30
        btn.clipsToBounds = true
        return btn
    }()
    
    @objc private func closeActionBtn(){
        ProgrammeDetailsCoordinator.init(navigationController: self.navigationViewC!).close()
    }
    
    @objc private func playActionBtn(){
        let player = AVPlayer(url: URL(string: "https://bitmovin-a.akamaihd.net/content/bbb/stream.m3u8")!)
        let vc = AVPlayerViewController()
        vc.player = player
        self.present(vc, animated: true) { vc.player?.play() }
    }
}
