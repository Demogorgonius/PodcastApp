//
//  PodcastCell.swift
//  Test6
//
//  Created by Vanopr on 25.09.2023.
//

import Foundation
import UIKit
import SnapKit

class PodcastCell: UICollectionViewCell {
    
    enum Cell {
        case podcast
        case AddToPlaylist
        case playlist
    }
    
    private var imageViewCell: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.backgroundColor = .palePink
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var titleLbl: UILabel = {
        let label = UILabel()
        label.font = .manropeBold(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descriptionLbl: UILabel = {
        let label = UILabel()
        label.font = .manropeRegular(size: 16)
        label.textColor = UIColor.systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = UIColor(white: 0, alpha: 0)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var cardView: UIView = {
        let viewCardView = UIView()
        viewCardView.backgroundColor = .ghostWhite
        viewCardView.layer.cornerRadius = 10
        viewCardView.translatesAutoresizingMaskIntoConstraints = false
        return viewCardView
    }()
    
    private let checkmarkButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.tintColor = UIColor.gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Please use this class from code.")
    }
    
    private func setupUI() {
        contentView.addSubview(cardView)
        cardView.addSubview(imageViewCell)
        cardView.addSubview(stackView)
        stackView.addArrangedSubview(titleLbl)
        stackView.addArrangedSubview(descriptionLbl)
        cardView.addSubview(checkmarkButton)
    }
    
    private func setupLayout() {
        cardView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().inset(32)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        imageViewCell.snp.makeConstraints { make in
            make.leading.equalTo(cardView).offset(16)
            make.centerY.equalTo(cardView)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(imageViewCell.snp.trailing).offset(16)
            make.trailing.equalTo(checkmarkButton.snp.leading).offset(-8)
            make.centerY.equalTo(cardView)
        }
        
        checkmarkButton.snp.makeConstraints { make in
            make.trailing.equalTo(cardView).inset(16)
            make.centerY.equalTo(stackView)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
    }
    
    
    
    public func setupPodcastCell(titleLeft: String, titleRight: String?, descriptionLeft: String, descriptionRight: String?, image: UIImage?, cellType: Cell?) {
        if let textR = titleRight {
            titleLbl.text = titleLeft + " | " + textR
        } else {
            titleLbl.text = titleLeft
        }
        if let textR = descriptionRight {
            descriptionLbl.text = descriptionLeft + " · " + textR
        } else {
            descriptionLbl.text = descriptionLeft
        }
        imageViewCell.image = image
        
        switch cellType {
        case .podcast:
            checkmarkButton.setImage(UIImage(systemName: "heart"), for: .normal)
            checkmarkButton.addTarget(self, action: #selector(toggleCheckmarkColor), for: .touchUpInside)
            break
        case .AddToPlaylist:
            checkmarkButton.setImage(UIImage(systemName: "plus.app"), for: .normal)
            checkmarkButton.addTarget(self, action: #selector(toggleCheckmarkImage), for: .touchUpInside)
            break
        case .none:
            break
        case .playlist:
            checkmarkButton.isHidden = true
            cardView.backgroundColor = .white
        }
    }
    
    @objc private func toggleCheckmarkColor() {
        if  checkmarkButton.tintColor == UIColor.gray {
            checkmarkButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            checkmarkButton.tintColor = UIColor.red
    } else {
        checkmarkButton.setImage(UIImage(systemName: "heart"), for: .normal)
        checkmarkButton.tintColor = UIColor.gray
    }
}
    @objc private func toggleCheckmarkImage() {
        if  checkmarkButton.tintColor == UIColor.gray {
            checkmarkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            checkmarkButton.tintColor = UIColor.green
        } else {
            checkmarkButton.setImage(UIImage(systemName: "plus.app"), for: .normal)
            checkmarkButton.tintColor = UIColor.gray
        }
    }
}
