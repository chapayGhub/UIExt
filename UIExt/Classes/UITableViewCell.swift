//
//  UITableViewCell.swift
//  Action
//
//  Created by Andrei on 1/2/18.
//

import UIKit

public extension UITableViewCell {
  
  public class func registerNib(in table: UITableView, identifier: String? = nil) {
    
    let nib = UINib(nibName: self.className,
                    bundle: Bundle(for: self.init().classForCoder ))
    table.register(nib,
                   forCellReuseIdentifier: identifier ?? self.className)
  }
  
  public class func register(in table: UITableView, identifier: String? = nil) {
    table.register(self,
                   forCellReuseIdentifier: identifier ?? self.className)
  }
  
  public class func cell(from table: UITableView,
                         for indexPath: IndexPath,
                         identifier: String? = nil) -> Self? {
    return _cell(from: table, for: indexPath, identifier: identifier)
  }
  
  private class func _cell<T>(from table: UITableView,
                              for indexPath: IndexPath,
                              identifier: String?) -> T? {
    return table.dequeueReusableCell(withIdentifier: identifier ?? self.className) as? T
  }
}
