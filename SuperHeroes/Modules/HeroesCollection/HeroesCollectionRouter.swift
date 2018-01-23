//
//  HeroesCollectionRouter.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 22/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class HeroesCollectionRouter: Router {
    
    func showHeroDetail(_ hero: SuperHero) {
        guard   let detailRouter = AppModules.HeroDetail.build().router as? HeroDetailRouter,
            let vc = self.presenter._view else { return }
        
        detailRouter.showHeroDetail(hero: hero, fromVC: vc)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HeroesCollectionRouter {
    var presenter: HeroesCollectionPresenter {
        return _presenter as! HeroesCollectionPresenter
    }
}
