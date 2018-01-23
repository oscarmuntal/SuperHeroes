//
//  HeroDetailPresenter.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 23/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class HeroDetailPresenter: Presenter {
    var hero: SuperHero?
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HeroDetailPresenter {
    var view: HeroDetailViewInterface {
        return _view as! HeroDetailViewInterface
    }
    var interactor: HeroDetailInteractor {
        return _interactor as! HeroDetailInteractor
    }
    var router: HeroDetailRouter {
        return _router as! HeroDetailRouter
    }
}
