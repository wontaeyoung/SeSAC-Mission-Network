//
//  APIManager.swift
//  Beer
//
//  Created by 원태영 on 1/16/24.
//

import Alamofire

struct APIManager {
  func callRequest<T: Codable>(type: T.Type, request: Constant.RequestURL, completionHandler: @escaping (T) -> Void) {
    AF
      .request(request.urlStr)
      .responseDecodable(of: T.self) { response in
        switch response.result {
          case .success(let success):
            completionHandler(success)
            
          case .failure(let failure):
            print(#function, failure.errorDescription ?? "에러 발생")
        }
      }
  }
}
