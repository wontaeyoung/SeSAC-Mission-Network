//
//  APIManager.swift
//  Lotto
//
//  Created by 원태영 on 1/16/24.
//

import Alamofire

struct APIManager {
  func callRequest(number: Int, completionHandler: @escaping (Lotto) -> Void) {
    let url: String = Constant.RequestURL.lotto(number).urlStr
    
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
}

