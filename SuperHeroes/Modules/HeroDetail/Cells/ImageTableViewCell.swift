//
//  ImageTableViewCell.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 23/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import SDWebImage

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var heroImage: UIImageView!
    
    func configure(superHero: SuperHero) {
        setImage(url: superHero.thumbnail)
    }
    
    private func setImage(url: String) {
        heroImage.sd_setImage(with: URL(string: url), completed: { [weak self] (image, error, cacheType, url) in
        })
    }
}
