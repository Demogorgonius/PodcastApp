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
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
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
		navigationController?.popViewController(animated: true)
	}
}

// MARK: - Layout
extension AccountSettingsViewController {
	func addSubviews() {
		view.addSubview(avatarView)
	}
	
	func setupConstraints() {
		avatarView.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalTo(view.safeAreaLayoutGuide).offset(37)
			make.height.equalTo(100)
			make.width.equalTo(105)
		}
	}
}
