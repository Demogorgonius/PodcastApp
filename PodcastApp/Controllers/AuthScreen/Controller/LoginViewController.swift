//
//  LoginViewController.swift
//  PodcastApp
//
//  Created by Ислам Пулатов on 9/26/23.
//

import UIKit
import SnapKit
import FirebaseAuth

final class LoginInViewController: UIViewController {
    
    // MARK: - UI
    
    private let loginLabel: UILabel = {
        return UILabel(labelText: "Логин", textColor: .gray)
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField(placeholder: "Логин", borderStyle: .roundedRect)
        return textField
    }()
    
    private let loginShowInidcator: UIImageView = {
        let indicator = UIImageView()
        indicator.image = UIImage(systemName: "eye")
        indicator.tintColor = .gray
        return indicator
    }()
    
    private let passwordLabel: UILabel = {
        return UILabel(labelText: "Пароль", textColor: .gray)
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField(placeholder: "Пароль", borderStyle: .roundedRect)
    }()
    
    private let passwordShowIndicator: UIImageView = {
        let passwordIndicator = UIImageView()
        passwordIndicator.image = UIImage(systemName: "eye")
        passwordIndicator.tintColor = .gray
        return passwordIndicator
    }()
    
    private lazy var loginAndPasswordStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginLabel, loginTextField, passwordLabel, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    private let enterButton: UIButton = {
        let button = UIButton(normalStateText: "Войти", normalStateTextColor: .white, backgroundColor: .skyBlue)
        button.layer.cornerRadius = 25.0
        button.addTarget(enterButtonPressed.self, action: #selector(enterButtonPressed), for: .touchUpInside)
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
        return button
    }()

    // MARK: - Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
}

extension LoginInViewController {
    
    // MARK: - Private Functions
    
    private func setUpView() {
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(loginAndPasswordStack)
        loginTextField.addSubview(loginShowInidcator)
        passwordTextField.addSubview(passwordShowIndicator)
        view.addSubview(enterButton)
        view.addSubview(continueStack)
        view.addSubview(continueWithGoogleLabel)
    }
    
    private func setConstraints() {
        
        loginAndPasswordStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(38)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
        
        loginShowInidcator.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalTo(20)
            make.trailing.equalTo(loginTextField).offset(-10)
            make.centerY.equalTo(loginTextField)
        }
                
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
        
        passwordShowIndicator.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalTo(20)
            make.trailing.equalTo(passwordTextField).offset(-10)
            make.centerY.equalTo(passwordTextField)
        }
        
        enterButton.snp.makeConstraints { make in
            make.top.equalTo(loginAndPasswordStack.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(57)
        }
        
        leftStrightLine.snp.makeConstraints { make in
            make.width.equalTo(67)
        }
        
        rightStraightLine.snp.makeConstraints { make in
            make.width.equalTo(67)
        }
        
        continueStack.snp.makeConstraints { make in
            make.top.equalTo(enterButton.snp.bottom).offset(45)
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
    }
    
    
    //  MARK: - @objc private Functions

    @objc func enterButtonPressed() {
        print("Enter Button Pressed")
    }
}