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
    guard let url = getURLComponents(with: request).url else {
      print(#function, APIError.convertURLFailed.description)
      
      return
    }
    
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
