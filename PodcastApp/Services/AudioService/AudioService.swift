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
    
    func playOrStop() {
        if let player = AudioService.shared.player, player.rate != 0 {
            player.pause()
        } else {
            player?.play()
        }
    }
    
    func isPlaying() -> Bool {
        player?.rate != 0
    }
    
    func playInTime(value: Float) {
        let seekTime = Double(value)
            let time = CMTime(seconds: seekTime, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        player?.seek(to: time)
    }
    
}
