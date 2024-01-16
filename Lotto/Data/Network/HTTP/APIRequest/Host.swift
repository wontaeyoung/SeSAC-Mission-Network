//
//  Host.swift
//  Lotto
//
//  Created by 원태영 on 1/16/24.
//

enum Host: String {
  case lotto = "www.dhlottery.co.kr"
  
  var domain: String {
    return self.rawValue
  }
}
