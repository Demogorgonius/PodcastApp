//
//  PlayerCollectionView.swift
//  PodcastApp
//
//  Created by Sergey on 06.10.2023.
//

import Foundation
import UIKit

class EpisodeCollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20.0
        super.init(frame: .zero, collectionViewLayout: layout)
        
        register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: PlayerCollectionViewCell.reuseId)
        backgroundColor = .none
        contentInset = UIEdgeInsets(top: 0, left: 20.0, bottom: 0, right: 20.0)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
