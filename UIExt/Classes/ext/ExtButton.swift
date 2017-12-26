//
//  ExtButton.swift
//  Pods-UIExt_Example
//
//  Created by chapayGhub on 12/25/17.
//

import UIKit

@IBDesignable
open class ExtButton: UIButton {

  @IBInspectable
  open var touchArea: CGSize = CGSize.zero
  
  @IBInspectable
  open var isRounded: Bool = false { didSet { setNeedsLayout() } }
  
  @IBInspectable
  open var iconColor: UIColor? = nil {
    didSet {
      if let iconColor = iconColor, let image = image(for: .normal) {
        setImage(image.colored(iconColor), for: .normal)
        setNeedsLayout()
      }
    }
  }

  private var backgroundColors: [UIControlState: UIColor] = [:]

  open override var isEnabled: Bool { didSet { update() } }

  open override var isSelected: Bool { didSet { update() } }

  open override var isHighlighted: Bool { didSet { update() } }

  private var roundedRadious: CGFloat { return min(frame.height, frame.width) / 2 }

  public convenience init() {
    self.init(frame: CGRect.zero)
  }
  
  public required override init(frame: CGRect) {
    super.init(frame: frame)
    initialization()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    decodeInit()
  }

  open override func awakeFromNib() {
    super.awakeFromNib()
    initialization()
  }
  
  open override func updateConstraints() {
    setupConstraints()
    super.updateConstraints()
  }
  
  open override func setImage(_ image: UIImage?, for state: UIControlState) {
    if let iconColor = iconColor, let image = image {
      super.setImage(image.colored(iconColor), for: state)
    } else {
      super.setImage(image, for: state)
    }
  }
  
  open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    if touchArea != CGSize.zero {
      let frame = self.bounds.insetBy(dx: -touchArea.width, dy: -touchArea.height)
      return frame.contains(point) ? self : nil
    } else {
      return super.hitTest(point, with: event)
    }
  }

  private func initialization() {
    designInit()
    #if !TARGET_INTERFACE_BUILDER
      setupActions()
    #endif
  }
  
  open override func decodeInit() {
    super.designInit()
    useAutoresizingMaskIntoConstraints = false
    if let color = backgroundColor {
      backgroundColors[.disabled] = color.withAlphaComponent(0.6)
      setBackgroundColor(color: color, forState: .normal )
    }
    titleLabel?.adjustsFontSizeToFitWidth = true
    titleLabel?.baselineAdjustment = .alignCenters
  }
  
  open override func designInit() {
    super.designInit()
    if let color = backgroundColor {
      backgroundColors[.disabled] = color.withAlphaComponent(0.6)
      setBackgroundColor(color: color, forState: .normal )
    }
    titleLabel?.adjustsFontSizeToFitWidth = true
    titleLabel?.baselineAdjustment = .alignCenters
  }
  
  override open func layoutSubviews() {
    super.layoutSubviews()
    if isRounded && cornerRadius != roundedRadious {
      super.cornerRadius = roundedRadious
    }
  }

  open var currentStateBackColor: UIColor? {
    return backgroundColorForState(state: state) ?? backgroundColor
  }
  
  open func setBackgroundColor(color: UIColor?, forState state: UIControlState) {
    backgroundColors[state] = color
    updateBackgroundColor()
  }

  open func backgroundColorForState(state: UIControlState) -> UIColor? {return backgroundColors[state] ?? backgroundColors[.normal] }

  private func update() { updateBackgroundColor() }
  
  private func updateBackgroundColor() { backgroundColor = currentStateBackColor }
}
