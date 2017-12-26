//
//  UIControlState.ext.swift
//  Pods-UIExt_Example
//
//  Created by chapayGhub on 12/25/17.
//

import UIKit

extension UIControlState: Hashable {
  public var hashValue: Int {
    return Int(rawValue)
  }
}

