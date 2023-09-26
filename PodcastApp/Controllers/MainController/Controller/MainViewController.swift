//
//  MainViewController.swift
//  PodcastApp
//
//  Created by Sergey on 25.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    let mainCollectionView = MainCollection()
    let mainProfileView = MainProfileView()
    let mainSeeAllView = MainSeeAllView()
     override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMainProfileView()
        setupMainSeeAllView()
        setupMainCollectionView()
        configureSeeAllButtons()
         
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupMainCollectionView() {
        view.addSubview(mainCollectionView)
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalTo(mainSeeAllView.snp.bottom).offset(5)
            make.leading.equalTo(view).offset(32)
            make.trailing.equalTo(view)
            make.bottom.equalTo(view).inset(50)
            
        }
    }
    private func setupMainProfileView() {
        view.addSubview(mainProfileView)
        mainProfileView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.leading.equalTo(view).offset(32)
            make.trailing.equalTo(view).inset(32)
            make.height.equalTo(50)
        }
    }
    
    private func setupMainSeeAllView() {
        view.addSubview(mainSeeAllView)
        mainSeeAllView.snp.makeConstraints { make in
            make.top.equalTo(mainProfileView.snp.bottom).offset(5)
            make.leading.equalTo(view).offset(32)
            make.trailing.equalTo(view).inset(32)
            make.height.equalTo(50)
        }
    }
}

