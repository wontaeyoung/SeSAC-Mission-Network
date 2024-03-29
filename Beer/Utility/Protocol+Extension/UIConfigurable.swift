//
//  UIConfigurable.swift
//  Beer
//
//  Created by 원태영 on 1/16/24.
//

import UIKit

protocol UIConfigurable: UIViewController {
  func configureUI()
}

protocol Registerable: UIConfigurable {
  func register<T: CellConfigurable>(cellType: T.Type)
}

protocol TableUIConfigurable: Registerable, UITableViewDelegate, UITableViewDataSource {
  func configureTableView()
}

protocol CollectionUIConfigurable: Registerable {
  func configureCollectionView()
}
