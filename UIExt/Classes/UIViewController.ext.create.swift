//
//  UIViewController.ext.create.swift
//
//  Pods-UIExt_Example
//
//  Created by chapayGhub on 12/25/17.
//
import UIKit

public extension UIViewController {
  
  public class func create(from viewController: UIViewController, with identifier: CustomStringConvertible? = nil) -> Self? {
    return viewController.storyboard.flatMap{ create(fromStoryboard: $0, withIdentifier: identifier?.description) }
  }
  
  public class func create(from storyboard: UIStoryboard, with identifier: CustomStringConvertible? = nil) -> Self? {
    return create(from: storyboard, with: identifier?.description)
  }
  
  public class func create(fromStoryboard: CustomStringConvertible, withIdentifier: CustomStringConvertible? = nil, bundle: Bundle? = nil) -> Self? {
    return createController(from: fromStoryboard.description, with: withIdentifier, bundle: bundle)
  }
}

private func createController<T: UIViewController>(from storyboard: String, with identifier: CustomStringConvertible?, bundle: Bundle? = nil) -> T? {
  let storyboard = createStoryboard(name: storyboard, bundle: bundle ?? Bundle.main )
  return createController(storyboard:storyboard, with: identifier ?? T.className)
}

private func createStoryboard(name: String, bundle: Bundle? = nil) -> UIStoryboard? {
  return UIStoryboard(name: name, bundle: bundle ?? Bundle.main )
}

private func createController<T: UIViewController>(from storyboard: UIStoryboard?, with identifier: CustomStringConvertible?) -> T? {
  return createController(storyboard:storyboard, with: identifier ?? T.className) as? T
}

private func createController<T: UIViewController>(storyboard: UIStoryboard?, with identifier: CustomStringConvertible?) -> T? {
  return storyboard?.instantiateViewController(withIdentifier: (identifier ?? T.className).description) as? T
}
