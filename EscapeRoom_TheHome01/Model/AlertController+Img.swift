//
//  AlertController+Img.swift
//  EscapeRoom_TheHome01
//
//  Created by 維衣 on 2022/3/5.
//

//import Foundation
import UIKit



//https://www.youtube.com/watch?v=d-tWSeGj5MY
extension UIAlertController {
    
    func addImage(image: UIImage) {
        let maxSize = CGSize(width: 245, height: 300)
        let imgSize = image.size
        
        var ratio : CGFloat!
        if (imgSize.width > imgSize.height) {
            ratio = maxSize.height / imgSize.width
        } else {
            ratio = maxSize.height / imgSize.height
        }
        
        let scaledSize = CGSize(width: imgSize.width * ratio, height: imgSize.height * ratio)
        
        var reaizedImage = image.imageWithSize(scaledSize)
        
        if (imgSize.height > imgSize.width) {
            let left = (imgSize.width - reaizedImage.size.height) / 2
            reaizedImage = reaizedImage.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: -left, bottom: 0, right: 0))
            
        }
        
        let imgAction = UIAlertAction(title: "", style: .default, handler: nil)
        imgAction.isEnabled = false
        imgAction.setValue(image.withRenderingMode(.alwaysOriginal), forKey: "image")
        self.addAction(imgAction)
    }
    
    
    
}
