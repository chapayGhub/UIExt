//
//  ExtTableViewController.swift
//  UIExt
//
//  Created by chapayGhub on 12/26/17.
//

import UIKit


open class ExtTableViewController: ExtViewController, ILifeTableViewController {
  
  @IBOutlet open weak var tableView: UITableView!
  
  //------------------------------------------------------------------------------
  //  MARK: Life
  //------------------------------------------------------------------------------
  
  open override func runSetup() {
    setupDesign()
    setupTable()
    setupActions()
    setupReady()
  }
  
  open func setupTable () { }
}
