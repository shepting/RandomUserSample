//
//  Images.swift
//  DemoPersonViewer
//
//  Created by Steven Hepting on 6/26/17.
//  Copyright © 2017 Hepting. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

func imageWithColor(color: UIColor, size: CGSize = CGSize(width: 48, height: 48)) -> UIImage {
    guard size.width > 0  else {
        print("Invalid size!")
        return UIImage()
    }
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(rect)
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return image
}


extension UIImageView {
    func roundWithRadius(_ radius: Int) {
        self.layer.cornerRadius = CGFloat(radius)
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1.0
    }
}
