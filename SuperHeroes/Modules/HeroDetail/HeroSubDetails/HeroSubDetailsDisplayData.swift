//
//  HeroSubDetailsDisplayData.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 24/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit
import SwiftyJSON

class HeroSubDetailsDisplayData: DisplayData {
    
    let reuseIdentifier = "cell"
    
    func key(_ data: JSON?) -> String {
        guard let data = data else { return "" }
        switch data["key"].stringValue{
        case "urls":
            return "type"
        default:
            return "name"
        }
    }
}
