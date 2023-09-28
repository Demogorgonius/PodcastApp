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
    
    static func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        // Выберите масштабный коэффициент, чтобы изображение подходило под целевой размер, сохраняя соотношение сторон
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Рассчитайте новые размеры на основе масштабного коэффициента
        let scaledSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)
        
        // Создайте контекст для рисования с новыми размерами
        UIGraphicsBeginImageContext(scaledSize)
        
        // Рисуйте уменьшенное изображение в контексте
        image.draw(in: CGRect(origin: .zero, size: scaledSize))
        
        // Получите уменьшенное изображение из контекста
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // Завершите контекст рисования
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
}
