//
//  LottoAPIEndpoint.swift
//  Lotto
//
//  Created by 원태영 on 1/16/24.
//

import Foundation

enum LottoAPIEndpoint: Endpoint {
  case getNumber(round: Int)
  
  var path: String {
    return "/common.do"
  }
  
  var queryItems: [URLQueryItem] {
    switch self {
      case .getNumber(let round):
        return [
          LottoAPIParameter.method.query,
          LottoAPIParameter.drwNo(round: round).query
        ]
    }
  }
}
