//
//  CreateAccountView.swift
//  PodcastApp
//
//  Created by Ислам Пулатов on 9/29/23.
//

import UIKit
import SnapKit

class CreateAccountView: UIView {
    
    // MARK: - UI Elements
    
    private let emailLabel: UILabel = {
        return UILabel(labelText: "Email", textColor: .gray)
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.text = "Enter your email address"
        textField.textColor = .gray
        textField.backgroundColor = .ghostWhite
        textField.layer.cornerRadius = 18
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton(normalStateText: "Continue with Email", normalStateTextColor: .white, backgroundColor: .skyBlue)
        button.layer.cornerRadius = 25.0
//        button.addTarget(enterButtonPressed.self, action: #selector(enterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Private Funcstions
    
    private func setUpView() {
        addSubViews()
        setConstrains()
    }
    
    private func addSubViews() {
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(continueButton)
    }
    
    private func setConstrains() {
        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(56)
        }
    }
    
    // MARK: - Corner Radius
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cornerRadius: CGFloat = 20.0
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}
