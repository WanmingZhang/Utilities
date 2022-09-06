//
//  CachedImageView.swift
//  Utility
//
//  Created by Zhang, Wanming on 9/4/22.
//

import Foundation
import UIKit

class CachedImageView: UIImageView {
    
    let imageCache = NSCache<NSString, UIImage>()
    var task: URLSessionDataTask!
    
    func image(_ urlStr: NSString) -> UIImage? {
        return imageCache.object(forKey: urlStr)
    }
    
    func loadImage(from url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
        if let task = task {
            task.cancel()
        }
        
        let str = NSString(string: url.absoluteString)
        // check for cached image
        if let image = image(str) {
            DispatchQueue.main.async {
                completion(image, nil)
            }
            return
        }
        
        task = URLSession.shared.dataTask(with: url as URL) { [weak self] data, response, error in
            guard let self = self else { return }
            guard let responseData = data, let image = UIImage(data: responseData) else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            // Cache the image.
            self.imageCache.setObject(image, forKey: NSString(string: url.absoluteString))
            
            DispatchQueue.main.async {
                completion(image, nil)
            }
        }
        
        task.resume()
    }
}
