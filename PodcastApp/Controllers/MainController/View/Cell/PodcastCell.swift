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
    
  var imageViewCell: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFit
    imageView.layer.cornerRadius = 5
    imageView.backgroundColor = .white
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
    
    var titleLblLeft: UILabel = {
      let label = UILabel()
        label.font = .manropeBold(size: 16)
        label.text = "LabelLeft"
        label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    var titleLblDivide: UILabel = {
        let label = UILabel()
        label.font = .manropeRegular(size: 16)
        label.text = " | "
        label.textColor = UIColor.systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
  var titleLblRight: UILabel = {
    let label = UILabel()
      label.font = .manropeBold(size: 16)
      label.text = "LabelRight"
      label.textColor = UIColor.systemGray
      label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
    
    var stackViewTitle: UIStackView = {
      let stackView = UIStackView()
      stackView.backgroundColor = UIColor(white: 0, alpha: 0)
        stackView.distribution = .equalSpacing
      stackView.axis = .horizontal
      stackView.alignment = .leading
      stackView.translatesAutoresizingMaskIntoConstraints = false
      return stackView
    }()
    
  var descriptionLblLeft: UILabel = {
    let label = UILabel()
      label.font = .manropeRegular(size: 16)
      label.text = "descriptionLblLeft"
      label.textColor = UIColor.systemGray
      label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
    
    var descriptionLblDivide: UILabel = {
      let label = UILabel()
        label.font = .manropeBold(size: 16)
        label.text = " · "
        label.textColor = UIColor.systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    var descriptionLblRight: UILabel = {
      let label = UILabel()
        label.font = .manropeRegular(size: 16)
        label.text = "descriptionLblRight"
        label.textColor = UIColor.systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

  var stackViewDescription: UIStackView = {
    let stackView = UIStackView()
    stackView.backgroundColor = UIColor(white: 0, alpha: 0)
    stackView.distribution = .equalSpacing
    stackView.axis = .horizontal
    stackView.alignment = .leading
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
    
    var stackView: UIStackView = {
      let stackView = UIStackView()
      stackView.backgroundColor = UIColor(white: 0, alpha: 0)
      stackView.distribution = .fillEqually
      stackView.axis = .vertical
      stackView.alignment = .leading
      stackView.translatesAutoresizingMaskIntoConstraints = false
      return stackView
    }()
    
  var cardView: UIView = {
    let viewCardView = UIView()
    viewCardView.backgroundColor = .ghostWhite
    viewCardView.layer.cornerRadius = 10
    viewCardView.translatesAutoresizingMaskIntoConstraints = false
    return viewCardView
  }()

    let checkmarkImage: UIImageView = {
    let checkmarkImage = UIImageView()
    checkmarkImage.contentMode = .scaleAspectFit
    checkmarkImage.image = UIImage(systemName: "heart")
    checkmarkImage.tintColor = UIColor.gray
    checkmarkImage.translatesAutoresizingMaskIntoConstraints = false
    return checkmarkImage
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
      stackView.addArrangedSubview(stackViewTitle)
      stackView.addArrangedSubview(stackViewDescription)
    cardView.addSubview(checkmarkImage)
    stackViewTitle.addArrangedSubview(titleLblLeft)
    stackViewTitle.addArrangedSubview(titleLblDivide)
    stackViewTitle.addArrangedSubview(titleLblRight)
    stackViewDescription.addArrangedSubview(descriptionLblLeft)
    stackViewDescription.addArrangedSubview(descriptionLblDivide)
    stackViewDescription.addArrangedSubview(descriptionLblRight)


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
          make.trailing.equalTo(checkmarkImage.snp.leading).offset(-8)
          make.centerY.equalTo(cardView)
      }

      checkmarkImage.snp.makeConstraints { make in
          make.trailing.equalTo(cardView).inset(16)
          make.centerY.equalTo(stackView)
          make.width.equalTo(24)
          make.height.equalTo(24)
      }
  }

  func toggleCheckmark() {
    if checkmarkImage.tintColor == UIColor.black {
      checkmarkImage.tintColor = UIColor.red
    } else {
      checkmarkImage.tintColor = UIColor.gray
    }
  }
}
