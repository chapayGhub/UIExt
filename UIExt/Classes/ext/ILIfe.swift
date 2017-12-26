//
//  IVCLIfe.swift
//  Pods-UIExt_Example
//
//  Created by chapayGhub on 12/25/17.
//

import UIKit

public protocol ILifeView: class {
  func decodeInit()
  func designInit()
  func setupActions()
  func setupConstraints()
}

public protocol ILifeViewController: class {
  func setupDesign()
  func setupActions()
  func setupReady()
}

public protocol ILifeTableViewController: class {
  func setupTable()
}
