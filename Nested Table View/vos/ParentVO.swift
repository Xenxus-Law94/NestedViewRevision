//
//  ParentVO.swift
//  Nested Table View
//
//  Created by tunlukhant on 9/15/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import Foundation

struct ParentVO: Codable {
    var id: Int?
    var parentName: String?
    var childs: [ChildVO]?
}
