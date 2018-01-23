//
//  MyCollectionViewCell.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 22/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import SDWebImage

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    
    func setImage(url: String) {
        heroImage.contentMode = .center
        heroImage.backgroundColor = UIColor.lightGray
        
        heroImage.sd_setImage(with: URL(string: url), completed: { [weak self] (image, error, cacheType, url) in
            self?.heroImage.contentMode = .scaleAspectFill
        })
    }
}
