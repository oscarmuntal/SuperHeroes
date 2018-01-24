//
//  FilterScreenDisplayData.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 24/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class FilterScreenDisplayData: DisplayData {
    
    let reuseIdentifier = "cell"
    
    func getPathFromFilter(_ filter: String) -> ApiManager.kAPI_ENDPOINT {
        switch filter {
        case "Comics":
            return .kAPI_ENDPOINT_GET_COMICS
        case "Events":
            return .kAPI_ENDPOINT_GET_EVENTS
        case "Series":
            return .kAPI_ENDPOINT_GET_SERIES
        case "Stories":
            return .kAPI_ENDPOINT_GET_STORIES
        default:
            return .kAPI_ENDPOINT_GET_COMICS
        }
    }
    
}
