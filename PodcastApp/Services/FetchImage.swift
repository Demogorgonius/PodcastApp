//
//  FetchImage.swift
//  PodcastApp
//
//  Created by Vanopr on 28.09.2023.
//

import Foundation
import UIKit

struct FetchImage {
    
    //MARK: - Загрузка изображений
    
    static func loadImageFromURL(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
          completion(nil)
          return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    
    static func resizeImage(image: UIImage?, targetSize: CGSize) -> UIImage? {
        guard let image = image else {return nil}
        let size = image.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let scaleFactor = min(widthRatio, heightRatio)
        let scaledSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)
        UIGraphicsBeginImageContext(scaledSize)
        image.draw(in: CGRect(origin: .zero, size: scaledSize))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }
}
