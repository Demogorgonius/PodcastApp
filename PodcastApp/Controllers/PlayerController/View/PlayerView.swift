//
//  PlayerView.swift
//  PodcastApp
//
//  Created by Sergey on 06.10.2023.
//

import Foundation
import UIKit
import SnapKit

protocol PlayerViewDelegate: AnyObject {
    
    func playerView(didButtonTapped button: UIButton)
    
}

class PlayerViewClass: CustomView {
    
    // MARK: Variables
    weak var delegate: PlayerViewDelegate?
    
    // MARK: - --- UI ---
    
    
    // MARK: - - Make labels:
    
    private lazy var episodeTitle = UILabel.makeLabel(font: .manropeExtraBold(size: 16.0), textColor: .santaGray)
    private lazy var podcastTitle = UILabel.makeLabel(font: .manropeRegular(size: 16.0), textColor: .purplyGrey)
    private lazy var timePassedLabel = UILabel.makeLabel(font: .manropeRegular(size: 14.0), textColor: .santaGray)
    private lazy var timeLeftLabel = UILabel.makeLabel(font: .manropeRegular(size: 14.0), textColor: .santaGray)
    
    //MARK: - - Make buttons:
    
    private lazy var shuffleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "shuffle"), for: .normal)
        button.tintColor = .purplyGrey
        return button
    }()
    
    private lazy var previousTrackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowtriangle.left.fill"), for: .normal)
        button.tintColor = .purplyGrey
        return button
    }()
    
    private lazy var nextTrackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowtriangle.right.fill"), for: .normal)
        button.tintColor = .purplyGrey
        return button
    }()
    
    private lazy var playTrackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        button.tintColor = .purplyGrey
        return button
    }()
    
    private lazy var repeatTrackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "repeat"), for: .normal)
        button.tintColor = .purplyGrey
        return button
    }()
    
    //MARK: - - Make slider:
    
    private lazy var progressBar: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = .purplyGrey
        return slider
    }()

    
    // MARK: setViews
    
    override func setViews() {
        super.setViews()
        
        
        
    }
    
    // MARK: layoutViews
    
    override func layoutViews() {
        super.layoutViews()
        
        
        
    }
    
}

// MARK: Extensions

extension PlayerViewClass {
    
    
    
}
