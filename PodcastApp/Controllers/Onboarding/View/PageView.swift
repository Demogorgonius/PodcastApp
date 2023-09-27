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
    
    //MARK: - Life Cycle
    
    override func setViews() {
        super.setViews()
        addSubview(logoImageView)
        addSubview(contentView)
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
        
    }
}
