//
//  NetworkClient.swift
//  Nested Table View
//
//  Created by tunlukhant on 9/21/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkClient {
    private let baseUrl: String
    
    private init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    private static var shareNetworkClient: NetworkClient = {
        let url = ShareConstant.BASE_URL
        return NetworkClient.init(baseUrl: url)
    }()
    
    class func shared() -> NetworkClient {
        return shareNetworkClient
    }
    
    public func getParent(success: @escaping (Any) -> Void,
                          failure: @escaping (String) -> Void) {
        print(baseUrl)
        Alamofire.request(baseUrl +
            ShareConstant.ApiRoute.GET_PARENT).responseData { (response) in
                switch response.result {
                case .success(let data):
                    success(data)
                    break
                case .failure(let err):
                    failure(err.localizedDescription)
                    break
                }
        }
    }
}
