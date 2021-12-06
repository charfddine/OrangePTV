//
//  ProgrammeCell.swift
//  OrangePTV
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import Foundation
import UIKit

class ProgrammeCell : UICollectionViewCell {
    
    var Programme : ProgrammeModel? {
        didSet {
            guard let img = Programme?.imageurl else { return }
            ProgrammeImage.downloaded(from: apiImageUrl + img)
            if let iconHidden = Programme?.detaillink?.contains("programme") { iconSerie.isHidden = iconHidden }
            ProgramTitleLabel.text = Programme?.title?[0].value
            ProgramSubtitleLabel.text = Programme?.subtitle
        }
    }
    
    private let ProgramTitleLabel : PaddingLabel = {
        let lbl = PaddingLabel()
        lbl.padding(0, 0, 3, 3)
        lbl.textColor = .black
        lbl.backgroundColor = .clear
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let ProgramSubtitleLabel : PaddingLabel = {
        let lbl = PaddingLabel()
        lbl.padding(0, 3, 3, 3)
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textColor = .black
        lbl.backgroundColor = .clear
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let iconSerie : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "serieICO.jpg")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private let ProgrammeImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 10
        return imgView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        let stackView = UIStackView(arrangedSubviews: [ProgramTitleLabel,ProgramSubtitleLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.backgroundColor = .gray
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 8
        stackView.layer.opacity = 0.7
        ProgrammeImage.addSubview(iconSerie)
        ProgrammeImage.addSubview(stackView)
        self.addSubview(ProgrammeImage)
        ProgrammeImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        iconSerie.anchor(top: ProgrammeImage.topAnchor, left: ProgrammeImage.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 40, height: 40, enableInsets: false)
        stackView.anchor(top: nil, left: ProgrammeImage.leftAnchor, bottom: ProgrammeImage.bottomAnchor, right: ProgrammeImage.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 35, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
