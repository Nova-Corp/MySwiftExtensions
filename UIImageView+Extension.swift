//
//  UIImageView+Extension.swift
//  Music-Details-Design-Task
//
//  Created by ADMIN on 10/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

let imageCache: NSCache<NSString, UIImage> = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func setImage(from url: URL,
                  contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        contentMode = mode
        if let imageCached = imageCache.object(forKey: url.absoluteString as NSString) {
            image = imageCached
            return
        }else{
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                }
            }.resume()
        }
    }
    func setImage(from link: String,
                  contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        setImage(from: url, contentMode: mode)
    }
}

