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
    
    private lazy var leftStrightLine: LineView = {
        let lineView = LineView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        lineView.backgroundColor = .clear
        return lineView
    }()
    
    private lazy var continueWithLabel: UILabel = {
        let label = UILabel(labelText: "Or continue with", textColor: .gray)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var rightStraightLine: LineView = {
        let lineView = LineView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        lineView.backgroundColor = .clear
        return lineView
    }()
    
    private lazy var continueStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [leftStrightLine, continueWithLabel, rightStraightLine])
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        return stackView
    }()
    
    private let continueWithGoogleLabel: UIButton = {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.title = "Continue with Google"
        buttonConfiguration.image = UIImage(named: "googleSymbol")
        buttonConfiguration.imagePadding = 12
        buttonConfiguration.baseForegroundColor = .black
        let button = UIButton(configuration: buttonConfiguration)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
//        button.addTarget(continueWithGoogleButtonPressed.self, action: #selector(continueWithGoogleButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let registerLabel: UILabel = {
        let label = UILabel()
        let text = "Already have an account? Login"
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: 0, length: text.count))
        let purpleRange = (text as NSString).range(of: "Login")
        attributedText.addAttribute(.foregroundColor, value: UIColor.lightPurple, range: purpleRange)
        label.attributedText = attributedText
        label.font = UIFont.systemFont(ofSize: 16)
        label.isUserInteractionEnabled = true
        return label
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
        addSubview(continueStack)
        addSubview(continueWithGoogleLabel)
        addSubview(registerLabel)
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
        
        leftStrightLine.snp.makeConstraints { make in
            make.width.equalTo(67)
        }
        
        rightStraightLine.snp.makeConstraints { make in
            make.width.equalTo(67)
        }
        
        continueStack.snp.makeConstraints { make in
            make.top.equalTo(continueButton.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(57)
            make.trailing.equalToSuperview().offset(-57)
            make.height.equalTo(30)
        }
        
        continueWithGoogleLabel.snp.makeConstraints { make in
            make.top.equalTo(continueStack.snp.bottom).offset(56)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
        registerLabel.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-33)
            make.centerX.equalToSuperview()
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
