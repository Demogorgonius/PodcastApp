//
//  MainView.swift
//  PodcastApp
//
//  Created by Sergey on 25.09.2023.
//

import Foundation
import UIKit
import SnapKit

let categoryNames = ["Popular 🔥", "Recent","News"
    ,"Music","Home","Travel","Design","Film","TV","Food","Language"]

import UIKit

class MainCollection: UIView, UICollectionViewDelegate {

    
    private let topHorizontalCollectionView1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    private let topHorizontalCollectionView2: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    private let bottomVerticalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupCollectionView()
        addSubview(topHorizontalCollectionView1)
        addSubview(topHorizontalCollectionView2)
        addSubview(bottomVerticalCollectionView)
        layoutCollectionViews()
        makeFirstCellActive()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        topHorizontalCollectionView1.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        topHorizontalCollectionView2.register(CategoryNameCell.self, forCellWithReuseIdentifier: "CategoryNameCell")
        bottomVerticalCollectionView.register(PodcastCell.self, forCellWithReuseIdentifier: "PodcastCell")
        setupCollectionViewDelegate(topHorizontalCollectionView1)
        setupCollectionViewDelegate(topHorizontalCollectionView2)
        setupCollectionViewDelegate(bottomVerticalCollectionView)
    }
    
    func setupCollectionViewDelegate(_ collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }

    func layoutCollectionViews() {
        let padding: CGFloat = 10
        topHorizontalCollectionView1.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        topHorizontalCollectionView2.snp.makeConstraints { make in
            make.top.equalTo(topHorizontalCollectionView1.snp.bottom).offset(padding)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
        bottomVerticalCollectionView.snp.makeConstraints { make in
            make.top.equalTo(topHorizontalCollectionView2.snp.bottom).offset(padding)
            make.trailing.equalTo(self).inset(32)
            make.leading.equalToSuperview()
            make.bottom.equalTo(self)
        }
    }
    
    func makeFirstCellActive() {
      let firstIndexPath = IndexPath(item: 0, section: 0)
        topHorizontalCollectionView2.selectItem(at: firstIndexPath, animated: false, scrollPosition: .centeredHorizontally)
    }
}

extension MainCollection: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topHorizontalCollectionView1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.categoryLabelTob.text = categoryNames[indexPath.row]
            cell.categoryLabelBottom.text = "1234"
                    if indexPath.row % 2 == 0 {
                        cell.layer.backgroundColor = UIColor.palePink.withAlphaComponent(0.5).cgColor
                    } else {
                        cell.layer.backgroundColor = UIColor.ghostWhite.withAlphaComponent(0.5).cgColor
                    }
            return cell
        } else if collectionView == topHorizontalCollectionView2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryNameCell", for: indexPath) as! CategoryNameCell
            cell.categoryLabel.text = categoryNames[indexPath.row]
            return cell
        } else if collectionView == bottomVerticalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PodcastCell", for: indexPath) as! PodcastCell
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topHorizontalCollectionView1 {
            return CGSize(width: 144, height: 85)
        } else if collectionView == topHorizontalCollectionView2 {
            let text = categoryNames[indexPath.row]
            let cellWidth = text.size(withAttributes: [.font: UIFont.systemFont(ofSize: 16)]).width + 40
            return CGSize(width: cellWidth, height: 44)
        } else if collectionView == bottomVerticalCollectionView {
            return CGSize(width: collectionView.layer.frame.width, height: 72)
        }
        return CGSize(width: 144, height: 72)
    }
}
