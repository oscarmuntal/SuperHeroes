//
//  HeroesCollectionView.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 22/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol HeroesCollectionViewInterface {
}

//MARK: HeroesCollectionView Class
final class HeroesCollectionView: UserInterface {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyListLabel: UILabel!
    
    @IBAction func filterButtonAction(_ sender: Any) {
    }
    
}


extension HeroesCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}

extension HeroesCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: displayData.reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell

        return cell
    }
    
}


//MARK: - Public interface
extension HeroesCollectionView: HeroesCollectionViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HeroesCollectionView {
    var presenter: HeroesCollectionPresenter {
        return _presenter as! HeroesCollectionPresenter
    }
    var displayData: HeroesCollectionDisplayData {
        return _displayData as! HeroesCollectionDisplayData
    }
}
