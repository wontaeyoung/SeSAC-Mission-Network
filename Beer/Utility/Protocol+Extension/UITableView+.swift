//
//  UITableView+.swift
//  Beer
//
//  Created by 원태영 on 1/16/24.
//

import UIKit

extension UITableView {
  func dequeueCell<T: CellConfigurable>(type: T.Type, indexPath: IndexPath) -> T {
    return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! T
  }
}
