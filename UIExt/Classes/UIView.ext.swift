//
//  UIView.ext.swift
//  Pods-UIExt_Example
//
//  Created by chapayGhub on 12/25/17.
//

import UIKit

extension UIView {

  @IBInspectable open var cornerRadius: CGFloat {
    get { return layer.cornerRadius }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue != 0
      refreshViewInBuilder()
    }
  }
  
  @IBInspectable open var borderWidth: CGFloat {
    get { return layer.borderWidth }
    set {
      layer.borderWidth = newValue
      refreshViewInBuilder()
    }
  }
  
  @IBInspectable open var borderColor: UIColor? {
    get { return layer.borderColor.flatMap { UIColor(cgColor: $0) } }
    set {
      layer.borderColor = newValue?.cgColor
      refreshViewInBuilder()
    }
  }
  
  open var useAutoresizingMaskIntoConstraints: Bool {
    get { return translatesAutoresizingMaskIntoConstraints }
    set {
      #if !TARGET_INTERFACE_BUILDER
        translatesAutoresizingMaskIntoConstraints = newValue
      #endif
    }
  }

  open func add(subviews: [UIView]) {
    for view in subviews {
      addSubview(view)
    }
  }
  
  open func removeAllSubviews() { subviews.forEach{$0.removeFromSuperview()} }
  
  open var viewSnapshot: UIImage? {
    var image: UIImage?
    UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0)
      self.drawHierarchy(in: bounds, afterScreenUpdates: true)
      image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
  
  private func refreshViewInBuilder() {
    #if TARGET_INTERFACE_BUILDER
      setNeedsLayout()
    #endif
  }
}
