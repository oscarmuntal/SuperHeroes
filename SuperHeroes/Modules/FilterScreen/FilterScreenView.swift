//
//  FilterScreenView.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 24/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol FilterScreenViewInterface {
}

//MARK: FilterScreenView Class
final class FilterScreenView: UserInterface {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = presenter.filter
    }
}

//MARK: - Public interface
extension FilterScreenView: FilterScreenViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension FilterScreenView {
    var presenter: FilterScreenPresenter {
        return _presenter as! FilterScreenPresenter
    }
    var displayData: FilterScreenDisplayData {
        return _displayData as! FilterScreenDisplayData
    }
}
