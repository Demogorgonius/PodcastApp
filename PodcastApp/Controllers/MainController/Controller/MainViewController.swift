//
//  MainViewController.swift
//  PodcastApp
//
//  Created by Sergey on 25.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    weak var mainCollectionView: MainCollection?
    var tabBar = UITabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMainCollectionView()
    }
    
    private func setupMainCollectionView() {
        let mainCollectionView = MainCollection()
        view.addSubview(mainCollectionView)
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view).offset(tabBar.frame.height)
            
        }
    }
}

