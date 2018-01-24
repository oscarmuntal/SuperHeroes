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

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyListLabel: UILabel!
    @IBOutlet weak var filterButton: UIButton!
    @IBAction func filterButtonAction(_ sender: Any) {
        filterButtonTapped()
    }
    
    var superHeroes: [SuperHero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoader()
        presenter.getSuperHeroes(updateUI: { superHeroes in
            self.hideLoader()
            self.setupUI(superHeroes)
        }) { error in
            //TODO: use error from API
        }
    }
    
}

extension HeroesCollectionView {
    
    fileprivate func setupUI(_ superHeroes: [SuperHero]) {
        emptyListLabel.text = displayData.emptyListText
        
        self.superHeroes.removeAll()
        for hero in superHeroes {
            self.superHeroes.append(hero)
        }
        emptyListLabel.isHidden = self.superHeroes.count != 0
        self.collectionView.reloadData()
    }
    
    fileprivate func filterButtonTapped() {
        var alertControllerStyle: UIAlertControllerStyle = .actionSheet
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            alertControllerStyle = .alert
        } else {
            alertControllerStyle = .actionSheet
        }
            let alert = UIAlertController(title: displayData.filtersTitle, message: displayData.filtersText, preferredStyle: alertControllerStyle)
            
            for filter in displayData.filters {
                alert.addAction(UIAlertAction(title: filter, style: .default, handler: { action in
                    self.presenter.filterChosen(filter: filter, setFilter: { superHeroes in
                        self.hideLoader()
                        self.setupUI(superHeroes)
                    }) { error in
                        //TODO: Use error from API
                    }
                }))
            }
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func showLoader() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        disableButtons()
    }
    
    private func hideLoader() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        enableButtons()
    }
    
    private func disableButtons() {
        filterButton.isEnabled = false
    }
    
    private func enableButtons() {
        filterButton.isEnabled = true
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
