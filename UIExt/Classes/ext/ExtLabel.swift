//
//  ExtLabel.swift
//  UIExt
//
//  Created by chapayGhub on 12/26/17.
//

import UIKit

@IBDesignable
open class ExtLabel: UILabel {
  
  //------------------------------------------------------------------------------
  //  MARK: life
  //------------------------------------------------------------------------------
  
  public convenience init() {
    self.init(frame: CGRect.zero)
  }
  
  required override public init(frame: CGRect) {
    super.init(frame: frame)
    designInitialisation()
  }
  
  override open func awakeFromNib() {
    super.awakeFromNib()
    designInitialisation()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    decodeInit()
  }
  
  open override func updateConstraints() {
    setupConstraints()
    super.updateConstraints()
  }
  
  //------------------------------------------------------------------------------
  //  MARK: design life
  //------------------------------------------------------------------------------
  
  public convenience init(font: UIFont, color: UIColor = UIColor.black, alignment: NSTextAlignment = .center, numberOfLines: Int = 1) {
    self.init(frame: CGRect.zero)
    self.font = font
    self.textColor = color
    self.textAlignment = alignment
    self.numberOfLines = numberOfLines
  }
  
  private func designInitialisation() {
    designInit()
    #if !TARGET_INTERFACE_BUILDER
      setupActions()
    #endif
  }
}

