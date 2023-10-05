//
//  FetchImage.swift
//  PodcastApp
//
//  Created by Vanopr on 28.09.2023.
//

import Foundation
import UIKit
import CommonCrypto

struct FetchImage {
    
    //MARK: - Загрузка изображений
    
    static func loadImageFromURL(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        // Вычисляем хеш URL, чтобы использовать его как ключ для кэширования
        let urlHash = sha256(input: urlString)
        
        // Проверяем, есть ли изображение в кэше
        if let cachedImage = imageCache[urlHash] {
            completion(cachedImage)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let image = UIImage(data: data)
            
            // Если изображение успешно загружено, сохраняем его в кэше
            if let image = image {
                imageCache[urlHash] = image
            }
            
            completion(image)
        }.resume()
    }

    // Простой кэш для локального хранения изображений
    private static var imageCache = [String: UIImage]()

    // Функция для вычисления хеша SHA-256 для строки
    private static func sha256(input: String) -> String {
        if let data = input.data(using: .utf8) {
            return sha256(data: data)
        }
        return ""
    }

    // Функция для вычисления хеша SHA-256 для данных
    private static func sha256(data: Data) -> String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        
        data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) in
            _ = CC_SHA256(bytes.baseAddress, CC_LONG(data.count), &digest)
        }
        
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
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
