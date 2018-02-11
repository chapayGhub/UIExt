//
//  UIViewController.ext.swift
//  UIExt
//
//  Created by Andrei on 1/14/18.
//

import UIKit

extension UIViewController {
  open func clearBackButtonTitle() {
    let button = UIBarButtonItem()
    button.title = ""
    navigationController?.navigationBar.topItem?.backBarButtonItem = button
  }
}

