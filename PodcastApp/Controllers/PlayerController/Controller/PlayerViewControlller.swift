//
//  PlayerViewControlller.swift
//  PodcastApp
//
//  Created by Sergey on 06.10.2023.
//

import Foundation
import UIKit
import PodcastIndexKit

class PlayerViewController: CustomViewController<PlayerViewClass> {
    
    // MARK: Variables
    
    private var episodeVC: EpisodeCollectionView!
    
    private var episodes: EpisodeArrayResponse?
    private var podcastName: String?
    private var id: Int = 0
    private var centerCell: PlayerCollectionViewCell?
    private var flag: Bool = false
    
    // MARK: init & viewDidLoad
    
    init(with episodes: EpisodeArrayResponse, podcastName: String?, id: Int) {
        
        self.episodes = episodes
        self.podcastName = podcastName
        self.id = id
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        episodeVC = EpisodeCollectionView()
        customView.configureScreen(episodeName: episodes?.items?[id].title ?? "", podcastName: podcastName ?? "")
        customView.episodeCollectionView.delegate = self
        customView.episodeCollectionView.dataSource = self
        customView.delegate = self
        scrollTo(id: id)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollTo(id: id)
        tabBarController?.tabBar.isHidden = true
    }
    
    
    
    
}

// MARK: - Extensions

private extension PlayerViewController {
    
    private func scrollTo(id: Int) {
            let indexPathToScroll = IndexPath(row: id, section: 0)
            customView.episodeCollectionView.scrollToItem(at: indexPathToScroll, at: .centeredHorizontally, animated: true)
        }
    
}

// MARK: - - UICollectionViewDelegate:

extension PlayerViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard episodes?.items?.count != 0 else {
            return
        }
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard scrollView is UICollectionView else { return }
    
        if let centerCellIndexPath: IndexPath = self.customView.episodeCollectionView.centerCellIndexPath {
                    customView.configureScreen(episodeName: episodes?.items?[centerCellIndexPath.row].title ?? "", podcastName: podcastName ?? "")
                }
    }
    
    
}

// MARK: - UICollectionViewDataSource
extension PlayerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = episodes?.items?.count {
            return count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let episodeCell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.reuseId, for: indexPath) as! PlayerCollectionViewCell
        let episode = episodes?.items?[indexPath.row]
        FetchImage.shared.loadImageFromURL(urlString: episode?.image ?? "") { image in
            let resizedImage = FetchImage.resizeImage(image: image, targetSize: CGSize(width: 279, height: 326))
            DispatchQueue.main.async {
                episodeCell.configureCell(for: resizedImage)
            }
        }
        return episodeCell
    }
    
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
//extension PlayerViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: 279.0, height: 326.0)
//    }
//}

extension PlayerViewController: PlayerViewDelegate {
    
    
    func playerView(didButtonTapped button: UIButton) {
        switch button.tag {
        case 6:
            let transition: CATransition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.reveal
            transition.subtype = CATransitionSubtype.fromBottom
            self.customView.window!.layer.add(transition, forKey: nil)
            self.dismiss(animated: false, completion: nil)
        default:
            break
        }
    }
    
}



