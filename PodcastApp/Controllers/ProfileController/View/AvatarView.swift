//
//  AvatarView.swift
//  PodcastApp
//
//  Created by VASILY IKONNIKOV on 28.09.2023.
//

import UIKit
import SnapKit

class AvatarView: UIView {
	private let avatarImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 50
		imageView.image = UIImage(named: "ProfileImg")
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	private let button: UIButton = {
		let button = UIButton()
		let image = UIImage(named: "Edit")
		button.setImage(image, for: .normal)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSabviews()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Layout
private extension AvatarView {
	func addSabviews() {
		addSubview(avatarImageView)
		addSubview(button)
	}
	
	func setupConstraints() {
		avatarImageView.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.leading.equalToSuperview()
			make.trailing.equalToSuperview()
			make.bottom.equalToSuperview()
		}
		
		button.snp.makeConstraints { make in
			make.trailing.equalToSuperview()
			make.bottom.equalToSuperview()
			make.height.equalTo(32)
			make.width.equalTo(32)
		}
	}
}
