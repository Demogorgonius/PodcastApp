//
//  PageView.swift
//  PodcastApp
//
//  Created by Aleksandr Garipov on 27.09.2023.
//

import UIKit
import SnapKit

class PageView: CustomView {
    
    //MARK: - UI Elements
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .firstPageLogo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(resource: .onboardingView)
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.numberOfLines = 0
        label.text = """
        SUPER APP
        SUPER APP
        SUPER APP
        """
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = """
        SUPER APP SUPER APP SUPER APP
        SUPER APP SUPER APP SUPER APP
        SUPER APP SUPER APP SUPER APP
        """
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - Life Cycle
    
    override func setViews() {
        super.setViews()
        addSubview(logoImageView)
        addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        setLayout()
        logoImageView.layer.cornerRadius = self.frame.height / 2
        logoImageView.clipsToBounds = true
    }
    
    //MARK: - Methods
    
    private func setLayout() {
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(68)
        }
        contentView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().inset(27)
            make.bottom.equalToSuperview().inset(20)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
    }
}
