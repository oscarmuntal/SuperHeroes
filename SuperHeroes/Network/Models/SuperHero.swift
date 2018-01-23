//
//  SuperHero.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 23/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import SwiftyJSON

class SuperHero {
    
    var id = 0
    var name = ""
    var description = ""
    var modified = ""
    var thumbnail = ""
    var comics: [JSON]?
    var series: [JSON]?
    var stories: [JSON]?
    var events: [JSON]?
    var urls: [JSON]?
    
    func parseSuperHero(data: JSON) {
        
        self.id = data["id"].intValue
        self.name = data["name"].stringValue
        self.description = data["description"].stringValue
        self.modified = data["modified"].stringValue
        self.thumbnail = data["thumbnail"]["path"].stringValue + "." + data["thumbnail"]["extension"].stringValue
        
        //TODO pending to parse the rest of the lists
    }
}
