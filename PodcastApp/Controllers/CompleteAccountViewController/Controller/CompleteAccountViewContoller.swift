//
//  CompleteAccountViewContoller.swift
//  PodcastApp
//
//  Created by Ислам Пулатов on 9/30/23.
//

import UIKit
import SnapKit

final class CompleteAccountViewContoller: UIViewController {
    
    //    MARK: - UI Elements
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "ArrowBack"), for: .normal)
        button.addTarget(backButtonPressed.self, action: #selector(backButtonPressed), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
        button.layer.cornerRadius = 24
        button.backgroundColor = .shadowGray
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(labelText: "Complet your account", textColor: .black)
        label.textAlignment = .center
        label.font = .manropeBold(size: 24)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel(labelText: "Enter your Credentials", textColor: .black)
        label.textAlignment = .center
        label.font = .manropeExtraBold(size: 16)
        return label
    }()
    
    //    MARK: - Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
}

extension CompleteAccountViewContoller {
    
    //    MARK: - Private Functions
    
    private func setUpView() {
        setNavigationBar()
        addSubViews()
        setConstrains()
    }
    
    private func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
    }
    
    func setNavigationBar() {
        let navigationBar = UINavigationBar()
        navigationBar.backgroundColor = .clear
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = UIImage()
        
        let navigationItem = UINavigationItem()
        let backButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.title = "Sign Up"
        
        navigationBar.items = [navigationItem]
        view.addSubview(navigationBar)
        
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
    }
    
    private func setConstrains() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(45)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.centerX.equalToSuperview()
        }
    }
    
    //  MARK: - Private objc func
    
    @objc private func backButtonPressed() {
        print("backButtonPressed")
        //        navigationController?.popViewController(animated: true)
    }
    
}
