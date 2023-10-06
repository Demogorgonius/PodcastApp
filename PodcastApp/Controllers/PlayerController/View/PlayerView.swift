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
    
    // MARK: UI
    
    
    // MARK: setViews
    
    func setViews() {
        super.setViews()
        
        
        
    }
    
    // MARK: layoutViews
    
    func layoutViews() {
        super.layoutViews()
        
        
        
    }
    
}

// MARK: Extensions

extension PlayerViewClass {
    
    
    
}
