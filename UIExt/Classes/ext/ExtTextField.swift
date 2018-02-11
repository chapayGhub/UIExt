//
//  ExtTextField.swift
//  UIExt
//
//  Created by Andrei on 1/27/18.
//

import UIKit

@IBDesignable
open class ExtTextField: UITextField {
  
  @IBInspectable open var containerInset: CGFloat = 15 { didSet { } }
  
  @IBInspectable open var intrinsicHeight: CGFloat = 50 {
    didSet {
      guard oldValue != intrinsicHeight else { return }
      invalidateIntrinsicContentSize()
    }
  }

  
  
  //------------------------------------------------------------------------------
  //  MARK: life
  //------------------------------------------------------------------------------
  
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

  private func initialization() {
    designInit()
    #if !TARGET_INTERFACE_BUILDER
      setupActions()
    #endif
  }
  
  //------------------------------------------------------------------------------
  //  MARK: design life
  //------------------------------------------------------------------------------
  
  public convenience init(_ font: UIFont, color: UIColor = UIColor.black, alignment: NSTextAlignment = .left) {
    self.init(frame: CGRect.zero)
    self.font = font
    self.textColor = color
    self.textAlignment = alignment
  }
  
  private func designInitialisation() {
    designInit()
    #if !TARGET_INTERFACE_BUILDER
      setupActions()
    #endif
  }
  
  //------------------------------------------------------------------------------
  //  MARK: overrides
  //------------------------------------------------------------------------------
  
  open override var intrinsicContentSize: CGSize {
    var size = super.intrinsicContentSize
    guard intrinsicHeight > 0 else { return size }
    size.height = intrinsicHeight
    return size
  }
  
  open override func textRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.textRect(forBounds: bounds)
    return CGRect(x: rect.origin.x + containerInset,
                  y: rect.origin.y,
                  width: rect.size.width - containerInset * 2,
                  height: rect.size.height)
  }
  
  open override func editingRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.editingRect(forBounds: bounds)
    return CGRect(x: rect.origin.x + containerInset,
                  y: rect.origin.y,
                  width: rect.size.width - containerInset * 2,
                  height: rect.size.height)
  }
  
  open var actionText: String? {
    get { return text }
    set {
      text = newValue
      sendActions(for: .valueChanged)
    }
  }
}
