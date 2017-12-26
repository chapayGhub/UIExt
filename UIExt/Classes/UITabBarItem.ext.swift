//
//  UITabBarItem.ext.swift
//
//  Pods-UIExt_Example
//
//  Created by chapayGhub on 12/25/17.
//

import UIKit
import Foundation

extension UITabBarItem {
  
  public convenience init(image: UIImage?, selectedImage: UIImage?) {
    self.init(title: nil, image: image, selectedImage: selectedImage)
    hideTitle ()
  }
  
  public func hideTitle() {
    self.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    self.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .selected)
    self.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .normal)
  }
  
  public func showTitle() {
    self.imageInsets = UIEdgeInsets.zero
    self.setTitleTextAttributes([:], for: .selected)
    self.setTitleTextAttributes([:], for: .normal)
  }
}
