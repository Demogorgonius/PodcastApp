//
//  ChannelViewController.swift
//  PodcastApp
//
//  Created by Vanopr on 02.10.2023.
//

import UIKit
import PodcastIndexKit

class ChannelViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let podcastIndexKit = PodcastIndexKit()
    private let channelView = Channel()
    var podcast: Podcast?
    private var episodes: EpisodeArrayResponse? {
        didSet {
            channelView.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        setupView()
        setupCollectionView()
        fetchDataForEpisodes(id: podcast?.id)
    }
    
    private func setupView() {
        view.addSubview(channelView)
        channelView.snp.makeConstraints { make in
            make.trailing.leading.equalTo(view)
            make.top.equalTo(view).offset(113)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        FetchImage.shared.loadImageFromURL(urlString: podcast?.image ?? "") { image in
            let resizedImage = FetchImage.resizeImage(image: image, targetSize: CGSize(width: 84, height: 84))
            DispatchQueue.main.async {
                self.channelView.setupChannel(title: self.podcast?.title ?? "",
                                              image: resizedImage)
            }
        }
    }
    
    private func setupCollectionView() {
        channelView.collectionView.dataSource = self
        channelView.collectionView.delegate = self
        channelView.collectionView.showsVerticalScrollIndicator = false
        channelView.collectionView.showsHorizontalScrollIndicator = false
    
    }
    
    private func fetchDataForEpisodes(id: Int?) {
        guard let  idInt = id else {return}
        Task {
            do {
                let data = try await podcastIndexKit.episodesService.episodes(byFeedID: String(idInt))
                episodes = data
                self.channelView.setupDescription(episodes: episodes?.items?.count ?? 0, description: podcast?.author ?? "")
                view.reloadInputViews()
                print(data)
            } catch {
                print("Произошла ошибка: \(error)")
            }
        }
    }
    
    private func secondsToTime(seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let remainingSeconds = seconds % 60
        let formattedHours = String(format: "%02d", hours)
        let formattedMinutes = String(format: "%02d", minutes)
        let formattedSeconds = String(format: "%02d", remainingSeconds)
        let time = "\(formattedHours):\(formattedMinutes):\(formattedSeconds)"
        return time
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodes?.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PodcastCell", for: indexPath) as! PodcastCell
        let episode = episodes?.items?[indexPath.row]
        FetchImage.shared.loadImageFromURL(urlString: episode?.image ?? "") { image in
            let resizedImage = FetchImage.resizeImage(image: image, targetSize: CGSize(width: 84, height: 84))
            let noEpisodeNumber = (self.episodes?.items?.count ?? 0) - indexPath.row
            DispatchQueue.main.async {
                cell.setupPodcastCell(
                    titleLeft: episode?.title ?? "",
                    descriptionLeft: self.secondsToTime(seconds: episode?.duration ?? 0),
                    descriptionRight: String(episode?.episode ?? noEpisodeNumber) + " Eps",
                    image: resizedImage)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 72)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let viewController = AllTrandingsPodcasts()
        //        viewController.name = categories?[indexPath.row]
        //        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

