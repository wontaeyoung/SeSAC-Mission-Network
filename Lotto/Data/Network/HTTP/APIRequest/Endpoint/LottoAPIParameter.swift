//
//  LottoAPIParameter.swift
//  Lotto
//
//  Created by 원태영 on 1/16/24.
//

import Foundation

enum LottoAPIParameter {
  case method
  case drwNo(round: Int)
  
  var query: URLQueryItem {
    switch self {
      case .method:
        return URLQueryItem(name: "method", value: "getLottoNumber")
        
      case .drwNo(let round):
        return URLQueryItem(name: "drwNo", value: round.description)
    }
  }
}
