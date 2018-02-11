//
//  ExtTableViewCell.swift
//  UIExt
//
//  Created by Andrei on 1/2/18.
//

import UIKit

open class ExtXibTableViewCell: UITableViewCell {
  
  //------------------------------------------------------------------------------
  //  MARK: life
  //------------------------------------------------------------------------------
  
  public convenience init() {
    self.init(frame: CGRect.zero)
  }
  
  public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  open override func awakeFromNib() {
    super.awakeFromNib()
    designInitialisation()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    decodeInit()
  }
  
  open override func updateConstraints() {
    setupConstraints()
    super.updateConstraints()
  }
  
  open override class var requiresConstraintBasedLayout: Bool {
    return true
  }
  
  //------------------------------------------------------------------------------
  //  MARK: design life
  //------------------------------------------------------------------------------
  
  private func designInitialisation() {
    designInit()
    #if !TARGET_INTERFACE_BUILDER
      setupActions()
    #endif
  }
  
  open override func designInit() {
    contentView.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
    backgroundColor = UIColor.clear
    selectionStyle = .none
    separatorInset = UIEdgeInsets.zero    
  }
}


open class ExtCodeTableViewCell: UITableViewCell {
  
  //------------------------------------------------------------------------------
  //  MARK: life
  //------------------------------------------------------------------------------
  
  public convenience init() {
    self.init(frame: CGRect.zero)
  }
  
  public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    designInitialisation()
  }
  
  open override func awakeFromNib() {
    super.awakeFromNib()
    designInitialisation()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    decodeInit()
  }
  
  open override func updateConstraints() {
    setupConstraints()
    super.updateConstraints()
  }
  
  open override class var requiresConstraintBasedLayout: Bool {
    return true
  }
  
  //------------------------------------------------------------------------------
  //  MARK: design life
  //------------------------------------------------------------------------------
  
  private func designInitialisation() {
    designInit()
    #if !TARGET_INTERFACE_BUILDER
      setupActions()
    #endif
  }
  
  open override func designInit() {
    contentView.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
    backgroundColor = UIColor.clear
    selectionStyle = .none
    separatorInset = UIEdgeInsets.zero
  }
}
