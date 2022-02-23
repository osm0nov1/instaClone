//
//  ViewController.swift
//  instaClone
//
//  Created by Rashit Osmonov on 16/2/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.register(LentaCell.self, forCellWithReuseIdentifier: "LentaCell")
        view.register(CustomStoryCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CustomStoryCell")
        return view
    }()
    
    private var totalArray: [InstaModel] = [
        InstaModel(name: "Санса Старк", publicImage: "image1", profileImage: "image1"),
        InstaModel(name: "Король Лич", publicImage: "image2", profileImage: "image2"),
        InstaModel(name: "Дейнерис Таргалион", publicImage: "image3", profileImage: "image3"),
        InstaModel(name: "Криштиано Роналдо", publicImage: "image4", profileImage: "image4"),
        InstaModel(name: "Стив Джопс", publicImage: "image5", profileImage: "image5"),
        InstaModel(name: "Стив Джопс", publicImage: "image5", profileImage: "image5"),
    ]
    
    private lazy var instaStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var button1: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "house"), for: .normal)
        view.tintColor = .black
        view.backgroundColor = .white
        return view
    }()
    private lazy var button2: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        view.tintColor = .black
        view.backgroundColor = .white
        return view
    }()
    private lazy var button3: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "plus.app"), for: .normal)
        view.tintColor = .black
        view.backgroundColor = .white
        return view
    }()
    private lazy var button4: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "message"), for: .normal)
        view.tintColor = .black
        view.backgroundColor = .white
        return view
    }()
    private lazy var button5: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "person.fill"), for: .normal)
        view.tintColor = .black
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        view.addSubview(instaStack)
        instaStack.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(view.frame.height / 9)
            make.width.equalToSuperview()
        }
        instaStack.addArrangedSubview(button1)
        instaStack.addArrangedSubview(button2)
        instaStack.addArrangedSubview(button3)
        instaStack.addArrangedSubview(button4)
        instaStack.addArrangedSubview(button5)
        
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LentaCell", for: indexPath) as! LentaCell
        let model = totalArray[indexPath.row]
        cell.fill(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CustomStoryCell", for: indexPath) as! CustomStoryCollectionView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
    }
    
}

