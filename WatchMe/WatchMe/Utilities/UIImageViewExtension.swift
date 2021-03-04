//
//  UIImageViewExtension.swift
//  WatchMe
//
//  Created by Sreekanth on 26/2/21.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    // MARK: - URL Image
    func setImage(from url: String?) {
        guard let imagePath = url,
             let imageURL = URL(string: imagePath) else { return }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    // MARK: - AF Image
    public func setImage(withURL: URL, placeholderImage: UIImage? = nil) {
        self.af.setImage(withURL: withURL, placeholderImage: placeholderImage)
    }
}
