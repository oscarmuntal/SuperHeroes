//
//  HeroesCollectionDisplayData.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 22/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class HeroesCollectionDisplayData: DisplayData {
    
    let emptyListText: String = "There are no Superheroes to show with this filter!"
    
    let reuseIdentifier = "cell"
    let filtersTitle = "Filters"
    let filtersText = "Please choose a filter:"
    
    let filters: [String] = [
        "Comics",
        "Events",
        "Series",
        "Stories"
    ]
}
