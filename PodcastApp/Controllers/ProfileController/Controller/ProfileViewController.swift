//
//  ProfileViewController.swift
//  PodcastApp
//
//  Created by Sergey on 25.09.2023.
//

class ProfileViewController: CustomViewController<ProfileView> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let profView = ProfileView()
        profView.buttonView.delegate = self
        view = profView
    }
    
}

extension ProfileViewController: ButtonViewDelegate {
    func didSelectButton() {
        let vc = AccountSettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

