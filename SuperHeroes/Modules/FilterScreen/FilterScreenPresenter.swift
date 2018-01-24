//
//  FilterScreenPresenter.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 24/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class FilterScreenPresenter: Presenter {
    
    var filter: String? 
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension FilterScreenPresenter {
    var view: FilterScreenViewInterface {
        return _view as! FilterScreenViewInterface
    }
    var interactor: FilterScreenInteractor {
        return _interactor as! FilterScreenInteractor
    }
    var router: FilterScreenRouter {
        return _router as! FilterScreenRouter
    }
}
