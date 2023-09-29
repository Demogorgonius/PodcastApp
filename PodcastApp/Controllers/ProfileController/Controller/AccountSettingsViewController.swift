//
//  AccountSettingsViewController.swift
//  PodcastApp
//
//  Created by VASILY IKONNIKOV on 27.09.2023.
//

import UIKit
import SnapKit

class AccountSettingsViewController: UIViewController {
    
    private let avatarView = AvatarView()
    private let profileInfo = ProfileInfo(title: "First Name")
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save Changes", for: .normal)
        button.setTitleColor(.santaGray, for: .normal)
        button.backgroundColor = .ghostWhite
        button.clipsToBounds = true
        button.layer.cornerRadius = 24
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        addSubviews()
        setupConstraints()
        setupNavigationBarAppearance()
    }
    
    private func setupNavigationBarAppearance() {
        let backButton = UIBarButtonItem(
            image: UIImage(named: "ArrowBack"),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
        
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.manropeRegular(size: 18) ?? UIFont.systemFont(ofSize: 18)
        ]
        
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = backButton
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "Profile"
    }
    
    @objc private func popToPrevious() {
        tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Layout
extension AccountSettingsViewController {
    func addSubviews() {
        view.addSubview(avatarView)
        view.addSubview(saveButton)
        view.addSubview(profileInfo)
    }
    
    func setupConstraints() {
        avatarView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(37)
            make.height.equalTo(100)
            make.width.equalTo(105)
        }
        
        saveButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-34)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
        profileInfo.snp.makeConstraints { make in
            make.top.equalTo(avatarView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(82)
        }
    }
}