//
//  APIManager.swift
//  Lotto
//
//  Created by 원태영 on 1/16/24.
//

import Alamofire
import Foundation

struct APIManager {
  func callRequest(_ request: APIRequest, completionHandler: @escaping (Lotto) -> Void) {
    /// URLComponents로 URL 만들었을 때 실패하는 원인 파악하기
    //    guard let url = try? getURLComponents(with: request).asURL() else {
    //      print(#function, APIError.convertURLFailed.description)
    //
    //      return
    //    }
    
    let url = getURLComponents(with: request).url
    
    AF
      .request(url)
      .responseDecodable(of: Lotto.self) { response in
        switch response.result {
          case .success(let success):
            completionHandler(success)
            
          case .failure(let failure):
            print(failure.localizedDescription)
        }
      }
  }
  
  private func getURLComponents(with apiRequest: APIRequest) -> URLComponents {
    var components = URLComponents()
    components.scheme = apiRequest.scheme.rawValue
    components.host = apiRequest.host.domain
    components.path = apiRequest.endpoint.path
    components.queryItems = apiRequest.endpoint.queryItems
    
    return components
  }
}

extension URLComponents {
  var url: String {
    guard
      let scheme,
      let host,
      let query
    else {
      return ""
    }
    
    return scheme + ":" + host + "/" + path + "?" + query
  }
}
