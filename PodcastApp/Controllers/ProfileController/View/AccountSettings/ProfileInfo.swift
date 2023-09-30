//
//  ProfileInfo.swift
//  PodcastApp
//
//  Created by VASILY IKONNIKOV on 28.09.2023.
//

import UIKit
import SnapKit

class ProfileInfo: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 26
        textField.layer.borderColor = UIColor.lightBlue.cgColor
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftView = padding
        textField.rightView = padding
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Calendar"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
private extension ProfileInfo {
    func addSubviews() {
        addSubview(titleLabel)
        addSubview(textField)
        textField.addSubview(button)
    }
    
    func addConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(52)
        }
        
        button.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
        }
    }
}
