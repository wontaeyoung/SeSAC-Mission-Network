//
//  CellConfigurable.swift
//  Beer
//
//  Created by 원태영 on 1/16/24.
//

import UIKit

protocol CellConfigurable: UITableViewCell {
  static var identifier: String { get }
  
  func configureCell()
}

protocol CellDataSettable: CellConfigurable {
  associatedtype Entity: Model
  
  func setData(data: Entity, tag: Int)
}
