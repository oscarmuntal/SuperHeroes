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
        filterButtonTapped()
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
            self.superHeroes.append(hero)
        }
        self.collectionView.reloadData()
    }
}

extension HeroesCollectionView {
    
    fileprivate func filterButtonTapped() {
        let alert = UIAlertController(title: displayData.filtersTitle, message: displayData.filtersText, preferredStyle: .actionSheet)
        
        for filter in displayData.filters {
            alert.addAction(UIAlertAction(title: filter, style: .default, handler: { action in
                self.presenter.filterChosen(filter)
            }))
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension HeroesCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.onHeroTapped(self.superHeroes[indexPath.row])
    }
    
}

extension HeroesCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.superHeroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: displayData.reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        cell.configure(superHero: self.superHeroes[indexPath.row])
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
