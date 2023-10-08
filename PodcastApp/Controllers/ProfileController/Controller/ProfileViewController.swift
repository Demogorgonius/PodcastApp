//
//  ProfileViewController.swift
//  PodcastApp
//
//  Created by Sergey on 25.09.2023.
//

import UIKit
import Firebase
import GoogleSignIn

class ProfileViewController: CustomViewController<ProfileView> {
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let profView = ProfileView()
        customView.delegateLogout = self
        customView.buttonView.delegate = self
        
//        view = profView
        if let size = tabBarController?.tabBar.frame.height {
            print(size)
            customView.setConstraintToButton(size)
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if var size = tabBarController?.tabBar.frame.height {
            if tabBarController?.tabBar.tag == 1 {
                size += 98
                print(size)
                customView.setConstraintToButton(size)
            } else {
                print(size)
                customView.setConstraintToButton(size)
            }
        }
    }
    
}

extension ProfileViewController: ButtonViewDelegate {
    func didSelectButton() {
        let vc = AccountSettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfileViewController: ProfileViewDelegate {
    
    func profileView(didTapLogOutButton button: UIButton) {
        
        if GIDSignIn.sharedInstance.currentUser != nil {
            GIDSignIn.sharedInstance.signOut()
        } else {
            do {
                try Auth.auth().signOut()
            } catch let error {
                print("Error. logOutButtonPress. already logged out: ", error.localizedDescription)
            }
        }
        
        defaults.set(nil, forKey: "onboardingWasShown")
        let onVC = OnboardingViewController()
        onVC.modalPresentationStyle = .fullScreen
        present(onVC, animated: true)
        
//        self.dismiss(animated: true)
    }
    
}

