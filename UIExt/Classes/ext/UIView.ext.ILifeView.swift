//
//  UIView.ext.ILifeView.swift
//  Pods-UIExt_Example
//
//  Created by chapayGhub on 12/25/17.
//

import Foundation

import UIKit

extension UIView: ILifeView {
  @objc
  open func decodeInit() {}
  
  @objc
  open func designInit() { useAutoresizingMaskIntoConstraints = false }
  
  @objc
  open func setupActions() {}
  
  @objc
  open func setupConstraints() {}
  
  @objc
  open override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setNeedsUpdateConstraints()
  }
}

