//
//  ExtView.swift
//  Pods-UIExt_Example
//
//  Created by chapayGhub on 12/25/17.
//

@IBDesignable
open class ExtView: UIView {

  open class func container() -> ExtView {
    let view = ExtView()
    view.backgroundColor = .clear
    return view
  }

  @IBInspectable open var isRounded: Bool = false { didSet { setNeedsLayout() } }

  public convenience init() {
    self.init(frame: CGRect.zero)
  }

  public required override init(frame: CGRect) {
    super.init(frame: frame)
    initialization()
  }

  open override func awakeFromNib() {
    super.awakeFromNib()
    initialization()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.decodeInit()
  }

  open override func updateConstraints() {
    self.setupConstraints()
    super.updateConstraints()
  }

  open override var cornerRadius: CGFloat { didSet { isRounded = roundedRadious != cornerRadius ? false : true } }

  fileprivate func initialization() {
    designInit()
    #if !TARGET_INTERFACE_BUILDER
      setupActions()
    #endif
  }

  open override func layoutSubviews() {
    super.layoutSubviews()
    if isRounded && cornerRadius != roundedRadious {
      super.cornerRadius = roundedRadious
    }
  }

  var roundedRadious: CGFloat {
    return min(frame.height, frame.width) / 2
  }
}
