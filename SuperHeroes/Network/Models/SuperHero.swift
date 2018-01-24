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
    var details: [JSON]?
    
    func parseSuperHero(data: JSON) {
        self.id = data["id"].intValue
        self.name = data["name"].stringValue
        self.description = data["description"].stringValue
        self.modified = data["modified"].stringValue
        self.thumbnail = data["thumbnail"]["path"].stringValue + "." + data["thumbnail"]["extension"].stringValue
        self.details = getDetails(data)
    }
    
    func getDetails(_ data: JSON) -> [JSON]{
        var details: [JSON] = []
        if let urls = data["urls"].array, urls.count > 0 {
            let detail: JSON = ["key" : "urls", "value" : urls]
            details.append(detail)
        }
        if let comics = data["comics"]["items"].array, comics.count > 0 {
            let detail: JSON = ["key" : "comics", "value" : comics]
            details.append(detail)
        }
        if let series = data["series"]["items"].array, series.count > 0 {
            let detail: JSON = ["key" : "series", "value" : series]
            details.append(detail)
        }
        if let stories = data["stories"]["items"].array, stories.count > 0 {
            let detail: JSON = ["key" : "stories", "value" : stories]
            details.append(detail)
        }
        if let events = data["events"]["items"].array, events.count > 0 {
            let detail: JSON = ["key" : "events", "value" : events]
            details.append(detail)
        }
        return details
    }
    
}
