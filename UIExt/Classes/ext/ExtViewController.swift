//
//  ExtViewController.swift
//  UIExt
//
//  Created by chapayGhub on 12/25/17.
//

import UIKit

open class ExtViewController: UIViewController, ILifeViewController {
  open override func viewDidLoad() {
    super.viewDidLoad()
    runSetup()
  }
  
  open func runSetup() {
    setupDesign()
    setupActions()
    setupReady()
  }
  
  open func setupDesign() {}
  open func setupActions() {}
  open func setupReady() {}
}
