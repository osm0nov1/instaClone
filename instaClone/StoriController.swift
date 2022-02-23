//
//  stori.swift
//  instaClone
//
//  Created by Rashit Osmonov on 16/2/22.
//

import Foundation
import UIKit
import SnapKit

class StoryCell: UICollectionViewCell{
    
    private lazy var profileImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.red.cgColor
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
       
        return view
    }()
    
    private lazy var profileLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 10, weight: .semibold)
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(profileImage)
        
        profileImage.snp.makeConstraints { make in
            make.centerX.top.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(frame.width / 2)
        }
        addSubview(profileLabel)
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    func fill(model: InstaModel){
        self.profileImage.image = UIImage(named: model.profileImage!)
        self.profileLabel.text = model.name!
    }
    
}
