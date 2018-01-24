//
//  FilterItem.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 24/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import SwiftyJSON

class FilterItem {
    
    var id: Int?
    var name: String?
    
    func parseFilterItem(data: JSON) {
        self.id = data["id"].intValue
        self.name = data["title"].stringValue
    }
}
