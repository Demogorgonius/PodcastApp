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
    
    private let password: UITextField = {
        return UITextField(placeholder: "Пароль", borderStyle: .roundedRect)
    }()
    
    private let enterButton: UIButton = {
        return UIButton(normalStateText: "Войти", backgroundColor: .blue)
    }()
    
    //    MARK: - Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
    }
    
    private func setConstrains() {
        
    }
    
}
