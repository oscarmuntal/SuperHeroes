//
//  HeroSubDetailsPresenter.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 24/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit
import SwiftyJSON

class HeroSubDetailsPresenter: Presenter {
    var data: JSON?
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HeroSubDetailsPresenter {
    var view: HeroSubDetailsViewInterface {
        return _view as! HeroSubDetailsViewInterface
    }
    var interactor: HeroSubDetailsInteractor {
        return _interactor as! HeroSubDetailsInteractor
    }
    var router: HeroSubDetailsRouter {
        return _router as! HeroSubDetailsRouter
    }
}
