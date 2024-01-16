//
//  RecommendBeerViewController.swift
//  Beer
//
//  Created by 원태영 on 1/16/24.
//

import UIKit
import Kingfisher

final class RecommendBeerViewController: UIViewController {
  
  @IBOutlet weak var beerImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
  
  private let manager = APIManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadingIndicator.startAnimating()
    configureUI()
    
    manager.callRequest(type: [Beer].self,
                        request: .randomBeer,
                        completionHandler: setData(beers:)
    )
  }
  
  private func setData(beers: [Beer]) {
    guard let beer = beers.first else {
      print(#function, "Empty")
      return
    }
    
    beerImageView.kf.setImage(with: beer.url) { [weak self] _ in
      guard let self else { return }
      
      loadingIndicator.stopAnimating()
      loadingIndicator.isHidden = true
      titleLabel.text = beer.name
      descriptionLabel.text = beer.description
    }
  }
}

// MARK: - Configure
extension RecommendBeerViewController: UIConfigurable {
  func configureUI() {
    configureImageView()
    configureLabel()
  }
  
  private func configureImageView() {
    beerImageView.contentMode = .scaleAspectFit
  }
  
  private func configureLabel() {
    titleLabel.configure(font: .boldSystemFont(ofSize: 17),
                         color: .label,
                         lineNumber: 1,
                         alignment: .center)
    descriptionLabel.configure(font: .systemFont(ofSize: 14),
                               color: .label,
                               lineNumber: 0)
  }
}
