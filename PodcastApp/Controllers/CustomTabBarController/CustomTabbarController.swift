//
//  CustomTabbarController.swift
//  PodcastApp
//
//  Created by Sergey on 25.09.2023.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        modalPresentationStyle = .automatic
        modalTransitionStyle = .crossDissolve
        
        let mainNavigationVC = UINavigationController(rootViewController: MainViewController())
        let searchNavigationVC = UINavigationController(rootViewController: SearchViewController())
        let favoritesNavigationVC = UINavigationController(rootViewController: FavoritesViewController())
        let profileNavigationVC = UINavigationController(rootViewController: ProfileViewController())
        
        setViewControllers([mainNavigationVC, searchNavigationVC, favoritesNavigationVC, profileNavigationVC], animated: false)
        
        customizeTabBar(mainNavigationVC, name: "Home page")
        customizeTabBar(favoritesNavigationVC, name: "Favorites")
        customizeTabBar(searchNavigationVC, name: "Search")
        customizeTabBar(profileNavigationVC, name: "Profile")
        self.navigationController?.navigationBar.prefersLargeTitles = false

    }
}

private extension CustomTabBarController {
    func customizeTabBar(_ controller: UINavigationController, name: String) {
        controller.viewControllers[0].title = name
        
        switch name {
        case "Home page":
            controller.tabBarItem.image = UIImage(systemName: "house")
            controller.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
            
            controller.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemTeal]
            controller.navigationBar.prefersLargeTitles = false
            controller.navigationItem.largeTitleDisplayMode = .automatic
            
            if #available(iOS 13.0, *) {
                let navBarApp: UINavigationBarAppearance = UINavigationBarAppearance()
                navBarApp.configureWithDefaultBackground()
                if #available(iOS 15.0, *) {
                    UINavigationBar.appearance().scrollEdgeAppearance = navBarApp
                }
            }
            guard let tabBar = controller.tabBarController?.tabBar else {
                print("ERROR: TabBar is not present (nil)")
                return
            }
            
            tabBar.tintColor = .systemGray
            tabBar.layer.cornerRadius = 25
            tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            tabBar.layer.masksToBounds = true
            
            if #available(iOS 13.0, *) {
                let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
                tabBarAppearance.configureWithDefaultBackground()
                if #available(iOS 15.0, *) {
                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                }
            }
            
        case "Favorites":
            controller.tabBarItem.image = UIImage(systemName: "heart")
            controller.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
            
        case "Search":
            controller.tabBarItem.image = UIImage(systemName: "magnifyingglass")
            controller.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
            controller.navigationBar.prefersLargeTitles = false
            controller.navigationItem.largeTitleDisplayMode = .automatic
            
        case "Profile":
            controller.tabBarItem.image = UIImage(systemName: "person")
            controller.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
            controller.navigationBar.prefersLargeTitles = false
            controller.navigationItem.largeTitleDisplayMode = .automatic
            
        default:
            print("Undefined case")
            break
        }
    }
}

