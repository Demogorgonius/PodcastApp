//
//  PlayerViewControlller.swift
//  PodcastApp
//
//  Created by Sergey on 06.10.2023.
//

import Foundation
import UIKit

class PlayerViewController: CustomViewController<PlayerViewClass> {
    
    // MARK: Variables
    
    // MARK: init & viewDidLoad
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}

// MARK: Extensions

extension PlayerViewController: PlayerViewDelegate {
    
    
    func playerView(didButtonTapped button: UIButton) {
        
    }
    
}
