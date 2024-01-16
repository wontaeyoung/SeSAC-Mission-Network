//
//  BeerTableViewCell.swift
//  Beer
//
//  Created by 원태영 on 1/16/24.
//

import UIKit
import Kingfisher

final class BeerTableViewCell: UITableViewCell {
  
  @IBOutlet weak var beerImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    configureCell()
  }
}

extension BeerTableViewCell: CellDataSettable {
  func configureCell() {
    beerImageView.contentMode = .scaleAspectFit
    titleLabel.configure(font: .boldSystemFont(ofSize: 15), color: .label, lineNumber: 1)
    descriptionLabel.configure(font: .systemFont(ofSize: 13), color: .label, lineNumber: 0)
  }
  
  func setData(data: Beer, tag: Int) {
    beerImageView.kf.setImage(with: data.url) { [weak self] _ in
      guard let self else { return }
      
      titleLabel.text = data.name
      descriptionLabel.text = data.description
    }
  }
}
