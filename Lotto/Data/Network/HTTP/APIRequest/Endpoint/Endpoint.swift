//
//  Protocol.swift
//  Lotto
//
//  Created by 원태영 on 1/16/24.
//

import Foundation

protocol Endpoint {
  var path: String { get }
  var queryItems: [URLQueryItem] { get }
}
