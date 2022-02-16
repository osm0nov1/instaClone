//
//  lentaCell.swift
//  instaClone
//
//  Created by Rashit Osmonov on 16/2/22.
//

import Foundation
import UIKit
import SnapKit

class LentaCell: UICollectionViewCell{
    
    private lazy var publicationImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var miniProfileImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var profileLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15, weight: .semibold)
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(miniProfileImage)
        miniProfileImage.layer.cornerRadius = 30
        miniProfileImage.clipsToBounds = true
        miniProfileImage.contentMode = .scaleAspectFit
        miniProfileImage.layer.borderWidth = 1
        miniProfileImage.layer.shadowColor = UIColor.red.cgColor
        miniProfileImage.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(8)
            make.width.equalTo(frame.height / 7)
            make.height.equalTo(frame.height / 7)
        }
        addSubview(profileLabel)
        profileLabel.snp.makeConstraints { make in
            make.centerY.equalTo(miniProfileImage)
            make.left.equalToSuperview().offset(frame.height / 7 + 8)
        }
        
        addSubview(publicationImage)
        publicationImage.snp.makeConstraints { make in
            make.top.equalTo(miniProfileImage.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func fill(model: InstaModel){
        self.publicationImage.image = UIImage(named: model.publicImage!)
        self.profileLabel.text = model.name
        self.miniProfileImage.image = UIImage(named: model.profileImage!)
    }
    
}
