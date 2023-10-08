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
    private var firstId: Int = 0
    private var currentId: Int = 0
    private var centerCell: PlayerCollectionViewCell?
    // MARK: init & viewDidLoad
    
    init(with episodes: EpisodeArrayResponse, podcastName: String?, id: Int) {
        
        self.episodes = episodes
        self.podcastName = podcastName
        self.firstId = id
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .automatic
        modalTransitionStyle = .crossDissolve
        navigationController?.navigationBar.isHidden = false
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollTo(id: firstId)
        currentId = firstId
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.episodeCollectionView.delegate = self
        customView.episodeCollectionView.dataSource = self
        customView.delegate = self
        episodeVC = EpisodeCollectionView()
        customView.configureScreen(episodeName: episodes?.items?[firstId].title ?? "", podcastName: podcastName ?? "", length: episodes?.items?[firstId].duration)
        playSong(id: firstId)
        

    }
    
    private func scrollTo(id: Int) {
        let indexPathToScroll = IndexPath(row: id, section: 0)
        customView.episodeCollectionView.scrollToItem(at: indexPathToScroll, at: .centeredHorizontally, animated: true)
    }
    
    private func playSong(id: Int) {
        guard  let episodeURL = episodes?.items?[id].enclosureUrl else { return }
        print("Start plaing \(episodeURL)")
        AudioService.shared.playAudio(from: episodeURL)
        customView.changePlayStopButton()
    }
}

// MARK: - Extensions

private extension PlayerViewController {
    

}

// MARK: - - UICollectionViewDelegate:

extension PlayerViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard episodes?.items?.count != 0 else {
            return
        }
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       
            guard scrollView is UICollectionView else { return }
            if let centerCellIndexPath: IndexPath = self.customView.episodeCollectionView.centerCellIndexPath {
                currentId = centerCellIndexPath.row
                customView.configureScreen(episodeName: episodes?.items?[currentId].title ?? "", podcastName: podcastName ?? "", length: episodes?.items?[currentId].duration)
                playSong(id: currentId)
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

    func button(didButtonTapped button: UIButton) {
        let buttonTag = button.tag
           // Определяем, какая кнопка была нажата
           switch buttonTag {
           case 1:
              
               break
           case 2:
               if currentId > 0 {
                   currentId -= 1
                   scrollTo(id: currentId)
                   playSong(id: currentId)
               }
               break
           case 3:
               AudioService.shared.playOrStop()
               customView.changePlayStopButton()
               break
           case 4:
               guard let numbersOfEpisodes = episodes?.items?.count else {return}
               if currentId < numbersOfEpisodes - 1 {
                   currentId += 1
                   scrollTo(id: currentId)
                   playSong(id: currentId)
               }
               break
           case 5:
               // Действия для кнопки repeatTrackButton
               // Например, изменение режима повтора трека
               break
           default:
               break
           }
    }
    
    func slider(sliderChange slider: UISlider) {
        guard let length = episodes?.items?[currentId].duration else { return}
        slider.maximumValue = Float(length)
        AudioService.shared.playInTime(value: slider.value)
    }
    
}
