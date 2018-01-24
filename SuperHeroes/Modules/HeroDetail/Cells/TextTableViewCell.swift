//
//  TextTableViewCell.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 23/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(superHero: SuperHero) {
        descriptionLabel.text = superHero.description != "" ? superHero.description : "(No description)"
    }
    
}
