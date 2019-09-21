//
//  ParentModel.swift
//  Nested Table View
//
//  Created by tunlukhant on 9/21/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ParentModel {
    class func shared() -> ParentModel {
        return sharedParentModel
    }
    
    private static var sharedParentModel: ParentModel = {
        let parentModel = ParentModel()
        return parentModel
    }()
    
    var parent: [ParentVO] = []
//    var parentResp: ParentResponse = ParentResponse()
    
    
    func modelGetParentList(success: @escaping ()-> Void,
                            failure: @escaping (String)-> Void) {
        NetworkClient.shared().getParent(success: { (data) in
            guard let data = data as? Data else {return}
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let parentList = try
                    decoder.decode([ParentVO].self, from: data)
                self.parent = parentList
                success()
            } catch let jsonErr {
                failure(jsonErr.localizedDescription)
            }
        }) { (error) in
            failure(error)
        }
    }
}
