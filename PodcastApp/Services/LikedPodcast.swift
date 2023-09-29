//
//  LikedPodcast.swift
//  PodcastApp
//
//  Created by Vanopr on 29.09.2023.
//

import Foundation
import RealmSwift

final class LikedPodcast {
    static let shared = LikedPodcast()
    var likedPodcasts: [Int] = []
    init(){} 
}
