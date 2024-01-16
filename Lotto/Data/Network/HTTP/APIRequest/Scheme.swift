//
//  Scheme.swift
//  Lotto
//
//  Created by 원태영 on 1/16/24.
//

enum Scheme: String {
  case http
  case https
  
  var name: String {
    self.rawValue
  }
}

