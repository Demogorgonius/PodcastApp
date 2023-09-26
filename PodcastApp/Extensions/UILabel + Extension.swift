//
//  UILabel + Extension.swift
//  PodcastApp
//
//  Created by Ислам Пулатов on 9/26/23.
//

import UIKit

extension UILabel {
    convenience init(labelText: String, textColor: UIColor) {
        self.init()
        self.text = labelText
        self.textColor = textColor
    }
}
