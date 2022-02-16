//
//  custom.swift
//  instaClone
//
//  Created by Rashit Osmonov on 16/2/22.
//

import Foundation
import UIKit
import SnapKit

class CustomStoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private var totalArray: [InstaModel] = [
        InstaModel(name: "Санса Старк", profileImage: "image1"),
        InstaModel(name: "Король Лич", profileImage: "image2"),
        InstaModel(name: "Дейнерис Таргалион", profileImage: "image3"),
        InstaModel(name: "Криштиано Роналдо", profileImage: "image4"),
        InstaModel(name: "Стив Джопс", profileImage: "image5"),
        InstaModel(name: "Стив Джопс", profileImage: "image5"),
    ]
    
    
    let storyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        setupCollectionView()
        setupSubViews()
    }
    
    func setupSubViews(){
        addSubview(storyCollectionView)
        storyCollectionView.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
        }
    }
    
    private func setupCollectionView(){
        storyCollectionView.register(StoryCell.self, forCellWithReuseIdentifier: "StoryCell")
    }
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return totalArray.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
            let model = totalArray[indexPath.row]
            cell.fill(model: model)
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.height - 10, height: frame.height - 10)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
