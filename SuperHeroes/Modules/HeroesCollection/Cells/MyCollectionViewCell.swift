//
//  MyCollectionViewCell.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import UIKit
import SDWebImage

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    
    func setImage(url: String) {
        heroImage.image = UIImage(named: "")
        heroImage.contentMode = .center
        heroImage.backgroundColor = UIColor.lightGray
        
        heroImage.sd_setImage(with: URL(string: url), completed: { [weak self] (image, error, cacheType, url) in
            self?.heroImage.contentMode = .scaleAspectFill
        })
    }
}
