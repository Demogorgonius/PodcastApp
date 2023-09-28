//
//  CreateAccountViewController.swift
//  PodcastApp
//
//  Created by Ислам Пулатов on 9/29/23.
//

import UIKit
import SnapKit

final class CreateAccountViewController: UIViewController {
    
    //    MARK: - UI
    
    private let titleLabel: UILabel = {
        let label = UILabel(labelText: "Create account", textColor: .white)
        label.textAlignment = .center
        label.font = .manropeBold(size: 24)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel(labelText: "Podcast App", textColor: .white)
        label.textAlignment = .center
        label.font = .manropeExtraBold(size: 16)
        return label
    }()

    //    MARK: - Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .skyBlue
        setUpView()
    }
    //    MARK: - Functions
    
    
}

extension CreateAccountViewController {
    
    //  MARK: - Private Functions
    
    private func setUpView() {
        addSubViews()
        setConstrains()
    }
    
    private func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
    }
    
    private func setConstrains() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
}
