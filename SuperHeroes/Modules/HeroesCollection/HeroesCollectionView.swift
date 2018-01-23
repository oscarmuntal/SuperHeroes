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
    
    var superHeroes: [SuperHero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getSuperHeroes(updateUI: { superHeroes in
            self.setupUI(superHeroes)
            
        }) { error in
            //TODO: use error from API
        }
    }
    
    func setupUI(_ superHeroes: [SuperHero]) {
        for hero in superHeroes {
            print("\(hero.name)")
            self.superHeroes.append(hero)
        }
        self.collectionView.reloadData()
    }
}


extension HeroesCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}

extension HeroesCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.superHeroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: displayData.reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        cell.myLabel.text = self.superHeroes[indexPath.row].name
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
