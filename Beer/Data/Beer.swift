//
//  Beer.swift
//  Beer
//
//  Created by 원태영 on 1/16/24.
//

import Foundation

struct Beer: Model {
  let name: String
  let description: String
  let image_url: String
  
  var url: URL? {
    return URL(string: image_url)
  }
}
