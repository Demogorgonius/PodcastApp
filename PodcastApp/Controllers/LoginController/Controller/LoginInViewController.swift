//
//  LoginInViewController.swift
//  PodcastApp
//
//  Created by Ислам Пулатов on 9/26/23.
//

import UIKit
import SnapKit
import FirebaseAuth

class LoginInViewController: UIViewController {
    
    //    MARK: - UI
    
    private let loginLabel: UILabel = {
        return UILabel(labelText: "Логин", textColor: .gray)
    }()
    
    private let loginTextField: UITextField = {
        return UITextField(placeholder: "Логин", borderStyle: .roundedRect)
    }()
    
    private let passwordLabel: UILabel = {
        return UILabel(labelText: "Пароль", textColor: .gray)
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField(placeholder: "Пароль", borderStyle: .roundedRect)
    }()
    
    private lazy var loginAndPasswordStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginLabel, loginTextField, passwordLabel, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    private let enterButton: UIButton = {
        return UIButton(normalStateText: "Войти", backgroundColor: .blue)
    }()
    
    //    MARK: - Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
}

extension LoginInViewController {
    
    //  MARK: - Private Functions
    
    private func setUpView() {
        addSubView()
        setConstrains()
    }
    
    private func addSubView() {
        view.addSubview(loginAndPasswordStack)
        view.addSubview(enterButton)
    }
    
    private func setConstrains() {
        
        loginAndPasswordStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(38)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        
        loginTextField.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(45)
        }

    }
    
}
