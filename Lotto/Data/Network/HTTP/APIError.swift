//
//  APIError.swift
//  Lotto
//
//  Created by 원태영 on 1/16/24.
//

enum APIError: Error {
  case convertURLFailed
  
  var description: String {
    switch self {
      case .convertURLFailed:
        return "URL 변환에 실패했습니다."
    }
  }
}
