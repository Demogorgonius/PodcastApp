//
//  AudioService.swift
//  PodcastApp
//
//  Created by Vanopr on 07.10.2023.
//

import Foundation
import AVFoundation
import MediaPlayer


class AudioService {
    static let shared = AudioService()
    private var player: AVPlayer?
    
    func playAudio(from urlString: String) {
        guard let audioURL = URL(string: urlString) else {return}
        let playerItem = AVPlayerItem(url: audioURL)
        player = AVPlayer(playerItem: playerItem)
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    func play() {
        player?.play()
    }
    
    func stop() {
        player?.pause()
        player = nil
    }
    
    
}
