//
//  Constant.swift
//  Lotto
//
//  Created by 원태영 on 1/16/24.
//

enum Constant {
  enum RequestURL {
    case lotto(Int)
    
    var urlStr: String {
      switch self {
        case .lotto(let number):
          return "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
      }
    }
  }
}
