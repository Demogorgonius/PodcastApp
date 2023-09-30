//
//  CompleteAccountViewContoller.swift
//  PodcastApp
//
//  Created by Ислам Пулатов on 9/30/23.
//

import UIKit
import SnapKit

final class CompleteAccountViewContoller: UIViewController {
    
    //    MARK: - UI Elements
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "ArrowBack"), for: .normal)
        button.addTarget(backButtonPressed.self, action: #selector(backButtonPressed), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
        button.layer.cornerRadius = 24
        button.backgroundColor = .shadowGray
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(labelText: "Complet your account", textColor: .black)
        label.textAlignment = .center
        label.font = .manropeBold(size: 24)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel(labelText: "Enter your Credentials", textColor: .black)
        label.textAlignment = .center
        label.font = .manropeExtraBold(size: 16)
        return label
    }()
    
    private let firstNameLabel: UILabel = {
        return UILabel(labelText: "First Name", textColor: .gray)
    }()
    
    private let firstNameTextField = {
        let textField = UITextField(placeHolder: "Enter your First Name", textColor: .gray, backGroundColor: .ghostWhite)
        return textField
    }()
    
    private let lastNameLabel: UILabel = {
        return UILabel(labelText: "Last Name", textColor: .gray)
    }()
    
    private let lastNameTextField: UITextField = {
        let textField = UITextField(placeHolder: "Enter your Last Name", textColor: .gray, backGroundColor: .ghostWhite)
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        return UILabel(labelText: "Password", textColor: .gray)
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(placeHolder: "Enter your password", textColor: .gray, backGroundColor: .ghostWhite)
        return textField
    }()
    
    private let passwordShowIndicator: UIImageView = {
        let passwordIndicator = UIImageView()
        passwordIndicator.image = UIImage(systemName: "eye")
        passwordIndicator.tintColor = .gray
        passwordIndicator.isUserInteractionEnabled = true
        return passwordIndicator
    }()
    
    private let confirmPasswordLabel: UILabel = {
        return UILabel(labelText: "Confirm Password", textColor: .gray)
    }()
    
    private let confirmPasswordTextField: UITextField = {
        let textField = UITextField(placeHolder: "Confirm your password", textColor: .gray, backGroundColor: .ghostWhite)
        return textField
    }()
    
    private let confirmPasswordShowIndicator: UIImageView = {
        let passwordIndicator = UIImageView()
        passwordIndicator.image = UIImage(systemName: "eye")
        passwordIndicator.tintColor = .gray
        passwordIndicator.isUserInteractionEnabled = true
        return passwordIndicator
    }()
    
    private lazy var credentialsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstNameLabel, firstNameTextField, lastNameLabel, lastNameTextField, passwordLabel, passwordTextField, confirmPasswordLabel, confirmPasswordTextField])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    
    //    MARK: - Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
}

extension CompleteAccountViewContoller {
    
    //    MARK: - Private Functions
    
    private func setUpView() {
        setNavigationBar()
        addSubViews()
        setConstrains()
    }
    
    func setNavigationBar() {
        let navigationBar = UINavigationBar()
        navigationBar.backgroundColor = .clear
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = UIImage()
        
        let navigationItem = UINavigationItem()
        let backButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.title = "Sign Up"
        
        navigationBar.items = [navigationItem]
        view.addSubview(navigationBar)
        
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
    }
    
    private func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(credentialsStackView)
        passwordTextField.addSubview(passwordShowIndicator)
        confirmPasswordTextField.addSubview(confirmPasswordShowIndicator)
    }
    
    private func setConstrains() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(45)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.centerX.equalToSuperview()
        }
        
        credentialsStackView.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        for textField in credentialsStackView.arrangedSubviews.compactMap({ $0 as? UITextField }) {
            textField.snp.makeConstraints { make in
                make.height.equalTo(52)
            }
        }
        
        passwordShowIndicator.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalTo(20)
            make.trailing.equalTo(passwordTextField).offset(-10)
            make.centerY.equalTo(passwordTextField)
        }
        
        confirmPasswordShowIndicator.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalTo(20)
            make.trailing.equalTo(confirmPasswordTextField).offset(-10)
            make.centerY.equalTo(confirmPasswordTextField)
        }
        
    }
    
    //  MARK: - Private objc func
    
    @objc private func backButtonPressed() {
        print("backButtonPressed")
        //        navigationController?.popViewController(animated: true)
    }
    
}
