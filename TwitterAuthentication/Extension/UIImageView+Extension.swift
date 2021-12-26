//
//  UIImageView+Extension.swift
//  TwitterAuthentication
//
//  Created by Chirag Vekariya on 26/12/21.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    func setImageFromURL(url: String) {
        self.sd_setImage(with: URL(string: url))
    }
    
}
