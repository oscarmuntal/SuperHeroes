//
//  BasicTableViewCell.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 23/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit

class BasicTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    enum HeroDetails: String {
        case detail = "detail"
        case wiki = "wiki"
        case comicLink = "comic link"
        case comics = "comics"
        case series = "series"
        case stories = "stories"
        case events = "events"
    }
    
    func configure(superHero: SuperHero, indexPath: IndexPath) {
        let row = indexPath.row - 2
        guard let details = superHero.details else { return }
        titleLabel.text = details[row]["key"].stringValue
    }
    
}
