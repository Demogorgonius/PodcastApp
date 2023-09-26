//
//  CustomTabbarController.swift
//  PodcastApp
//
//  Created by Sergey on 25.09.2023.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: MainViewController(),
                title: "Home",
                image: UIImage(named: "Home"),
                selectedImage: UIImage(named: "HomeFill")
            ),
            generateVC(
                viewController: SearchViewController(),
                title: "Search",
                image: UIImage(named: "Search"),
                selectedImage: UIImage(named: "SearchFill")
            ),
            generateVC(
                viewController: FavoritesViewController(),
                title: "Favorites",
                image: UIImage(named: "Bookmark"),
                selectedImage: UIImage(named: "BookmarkFill")
            ),
            generateVC(
                viewController: ProfileViewController(),
                title: "Profile",
                image: UIImage(named: "Profile"),
                selectedImage: UIImage(named: "ProfileFill")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?, selectedImage: UIImage?) -> UIViewController {
        let vc = UINavigationController(rootViewController: viewController)
//        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = selectedImage
        return vc
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 4
        )
        
        roundLayer.path = bezierPath.cgPath
        
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.white.cgColor
        
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
        tabBar.layer.shadowOffset = CGSize(width: -4, height: -6)
        tabBar.layer.shadowOpacity = 0.9
        tabBar.layer.shadowRadius = 20
    }

}

