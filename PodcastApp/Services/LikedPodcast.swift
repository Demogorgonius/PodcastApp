//
//  LikedPodcast.swift
//  PodcastApp
//
//  Created by Vanopr on 29.09.2023.
//

import Foundation

final class LikedPodcast {
  static let shared = LikedPodcast()
  var selectedIngredients: [Int] = []
  private init() {}
}
