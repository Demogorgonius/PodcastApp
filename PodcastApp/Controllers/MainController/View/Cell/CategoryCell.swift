//
//  CategoryCell.swift
//  Test6
//
//  Created by Vanopr on 26.09.2023.
//


import Foundation
import UIKit
import SnapKit

class CategoryCell: UICollectionViewCell {

  static let identifier = "CategoryCell"
   var categoryLabelTob = UILabel.makeLabel(text: "", font: .manropeBold(size: 16), textColor: .black)
  var categoryLabelBottom = UILabel.makeLabel(text: "", font: .manropeRegular(size: 14), textColor: .gray)
  let stackView = UIStackView()
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
    setupUICell()
  }

  func setupUICell() {
    backgroundColor = .white
    layer.masksToBounds = false
    layer.cornerRadius = 25
    categoryLabelTob.numberOfLines = 1
    categoryLabelTob.adjustsFontSizeToFitWidth = false
    categoryLabelBottom.numberOfLines = 1
    categoryLabelBottom.adjustsFontSizeToFitWidth = false
    stackView.axis = .vertical
    stackView.alignment = .leading
    stackView.spacing = 0
      
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
      stackView.addArrangedSubview(categoryLabelTob)
      stackView.addArrangedSubview(categoryLabelBottom)
    contentView.addSubview(stackView)
  }

  private func setupConstraints() {
      stackView.snp.makeConstraints { make in
          make.centerY.equalTo(contentView)
          make.height.equalTo(50)
          make.leading.equalTo(contentView).offset(15)
          make.trailing.equalTo(contentView)
      }
  }
}
