//
//  ExtImageView.swift
//  Pods-UIExt_Example
//
//  Created by chapayGhub on 12/25/17.
//

import UIKit

@IBDesignable
open class ExtImageView: UIImageView {
  
  @IBInspectable open var isRounded: Bool = false { didSet { setNeedsLayout() } }
  
  @IBInspectable open var imageColor: UIColor? = nil { didSet { super.image = imageColor.flatMap{image?.colored($0)} } }
  
  open override var image: UIImage? {
    get { return super.image }
    set { super.image = imageColor.flatMap{ newValue?.colored($0) } ?? newValue }
  }
  
  public convenience init() {
    self.init(frame: CGRect.zero)
  }
  
  required override public init(frame: CGRect) {
    super.init(frame: frame)
    initialization()
  }
  
  override open func awakeFromNib() {
    super.awakeFromNib()
    initialization()
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
  
  private func initialization() {
    designInit()
    #if !TARGET_INTERFACE_BUILDER
      setupActions()
    #endif
  }
  
  override open func layoutSubviews() {
    super.layoutSubviews()
    if isRounded && cornerRadius != roundedRadious {
      super.cornerRadius = roundedRadious
    }
  }
  
  var roundedRadious: CGFloat {
    return min(frame.height, frame.width) / 2
  }
}
