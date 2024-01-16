//
//  BeerTableViewController.swift
//  Beer
//
//  Created by 원태영 on 1/16/24.
//

import UIKit

final class BeerTableViewController: UIViewController {
  
  @IBOutlet weak var beerTableView: UITableView!
  
  private let manager = APIManager()
  private var beers: [Beer] = [] {
    didSet {
      beerTableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    register(cellType: BeerTableViewCell.self)
    configureTableView()
    manager.callRequest(
      type: [Beer].self,
      request: .beerList
    ) { beers in
      self.beers = beers
    }
  }
}

extension BeerTableViewController: TableUIConfigurable {
  func register<T: CellConfigurable>(cellType: T.Type) {
    let xib = UINib(nibName: cellType.identifier, bundle: nil)
    
    beerTableView.register(xib, forCellReuseIdentifier: cellType.identifier)
  }
  
  func configureTableView() {
    beerTableView.delegate = self
    beerTableView.dataSource = self
    beerTableView.allowsSelection = false
  }
  
  func configureUI() { }
}

extension BeerTableViewController {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return beers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: BeerTableViewCell = tableView.dequeueCell(type: BeerTableViewCell.self, indexPath: indexPath)
    let beer: Beer = beers[indexPath.row]
    
    cell.setData(data: beer, tag: indexPath.row)
    
    return cell
  }
}
