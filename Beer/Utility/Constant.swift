//
//  Constant.swift
//  Beer
//
//  Created by 원태영 on 1/16/24.
//

enum Constant {
  enum RequestURL {
    case randomBeer
    case beerList
    
    var urlStr: String {
      switch self {
        case .randomBeer:
          return "https://api.punkapi.com/v2/beers/random"
          
        case .beerList:
          return "https://api.punkapi.com/v2/beers"
      }
    }
  }
}
