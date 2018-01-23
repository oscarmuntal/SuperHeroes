//
//  HeroDetailView.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 23/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol HeroDetailViewInterface {
}

//MARK: HeroDetailView Class
final class HeroDetailView: UserInterface {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

//MARK: - Private methods
extension HeroDetailView {
    
    fileprivate func setUI() {
        title  = presenter.hero?.name
    }
}

//MARK: - Public interface
extension HeroDetailView: HeroDetailViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HeroDetailView {
    var presenter: HeroDetailPresenter {
        return _presenter as! HeroDetailPresenter
    }
    var displayData: HeroDetailDisplayData {
        return _displayData as! HeroDetailDisplayData
    }
}
