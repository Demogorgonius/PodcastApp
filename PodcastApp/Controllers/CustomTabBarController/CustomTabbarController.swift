//
//  CustomTabbarController.swift
//  PodcastApp
//
//  Created by Sergey on 25.09.2023.
//

import UIKit
import PodcastIndexKit

class CustomTabBarController: UITabBarController {
    
    let miniPayer = MiniPlayerView()
    var id: Int = 0
    var episodArray: EpisodeArrayResponse?
    var podcastName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
        setupMiniPlayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.isHidden = false
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
    
     func setupMiniPlayer() {
        view.addSubview(miniPayer)
        miniPayer.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.bottom.equalTo(tabBar.snp.top).offset(-20)
            make.height.equalTo(68)
        }
         miniPayer.isHidden = true
         tabBar.tag = 0
    }

}

extension CustomTabBarController: MiniPlayerDelegate {
    func didSelectCell(withId id: Int, allEpisodes: EpisodeArrayResponse, podcastName: String) {
        print(id)
        self.id = id
        self.episodArray = allEpisodes
        self.podcastName = podcastName
        
        guard  let episode = allEpisodes.items?[id] else { return }
        playSongAndSetupMiniPayer(with: episode)
        
        
        miniPayer.isHidden = false
        tabBar.tag = 1
        view.reloadInputViews()
        miniPayer.playButton.addTarget(self, action: #selector(playStopButton), for: .touchUpInside)
        miniPayer.forwardButton.addTarget(self, action: #selector(forwardButton), for: .touchUpInside)
        miniPayer.backButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(bigPlayer(_:)))
        miniPayer.backView.addGestureRecognizer(tapGesture)
        miniPayer.backView.addGestureRecognizer(createSwipe(direction: .down))
        miniPayer.backView.addGestureRecognizer(createSwipe(direction: .up))

    }
    
    @objc func playStopButton() {
            miniPayer.togglePlayButton()
    }
    
    @objc func forwardButton() {
        guard  let episodes = episodArray?.items else { return }
        if id < episodes.count {
            self.id += 1
            print(id)
            let episode = episodes[id]
            playSongAndSetupMiniPayer(with: episode)
        } else {
            id = 0
            let episode = episodes[id]
            playSongAndSetupMiniPayer(with: episode)
        }
    }
    
    @objc func backButton() {
        guard  let episodes = episodArray?.items else { return }
        if id > 0 {
            self.id -= 1
            print(id)
            let episode = episodes[id]
            playSongAndSetupMiniPayer(with: episode)
        } else {
            self.id = episodes.count - 1
            let episode = episodes[id]
            playSongAndSetupMiniPayer(with: episode)
        }
    }

    private func playSongAndSetupMiniPayer(with episode: Episode) {
        
        let title = (episode.title ?? "") +  "  E \(episode.episode ?? 0 )"
        AudioService.shared.playAudio(from: episode.enclosureUrl ?? "")
        FetchImage.shared.loadImageFromURL(urlString: episode.image ?? "") { image in
            let resizedImage = FetchImage.resizeImage(image: image, targetSize: CGSize(width: 43, height: 43))
            self.miniPayer.setupMiniPlayer(image: resizedImage, title: title)
        }
    }
    
    //MARK: - Tap gesture action
    
    @objc func bigPlayer(_ gesture: UITapGestureRecognizer) {

        guard let episodes = episodArray else {return}
        let playerViewController = PlayerViewController(with: episodes, podcastName: podcastName, id: id)
        playerViewController.modalPresentationStyle = .custom
        playerViewController.modalTransitionStyle = .coverVertical
        present(playerViewController, animated: true, completion: nil)
    }
    
    
    
    //MARK: - Add swipe gesture action
    
    private func createSwipe(direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeGestureRecognizer.direction = direction
        return swipeGestureRecognizer
    }
    
    @objc func didSwipe(_ sender: UISwipeGestureRecognizer) {
        
        switch sender.direction {
        case .up:
            guard let episodes = episodArray else {return}
            let playerViewController = PlayerViewController(with: episodes, podcastName: podcastName, id: id)
            playerViewController.modalPresentationStyle = .custom
            playerViewController.modalTransitionStyle = .coverVertical
            present(playerViewController, animated: true, completion: nil)
            
        case .down:
            AudioService.shared.stop()
            miniPayer.isHidden = true
            tabBar.tag = 0
      
        default:
            return
        }
        
    }
    
}


