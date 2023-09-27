//
//  AllCategoresController.swift
//  PodcastApp
//
//  Created by Vanopr on 27.09.2023.
//

import UIKit

class AllCategoriesController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Добавьте коллекцию на весь экран
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        collectionView.register(PodcastCell.self, forCellWithReuseIdentifier: "PodcastCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        navigationController?.navigationBar.isHidden = false

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PodcastCell", for: indexPath) as! PodcastCell
        cell.setupPodcastCell(titleLeft: "Category Name",
                              descriptionLeft: "59",
                              image: UIImage(systemName: "heart"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 72)
    }
}
