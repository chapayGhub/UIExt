//
//  IClassDescription.swift
//  Pods-UIExt_Example
//
//  Created by chapayGhub on 12/25/17.
//

import UIKit

public protocol IClassDescription: class {
  static var className: String { get }
         var className: String { get }
}

extension IClassDescription {
  public static var className: String {
    return String(describing: self)
  }
  public var className: String { return self.className }
}

extension UIViewController: IClassDescription {}
extension UIView: IClassDescription {}
