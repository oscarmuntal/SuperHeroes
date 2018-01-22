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
