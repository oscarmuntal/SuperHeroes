//
//  HeroDetailRouter.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 23/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit
import SwiftyJSON

class HeroDetailRouter: Router {
    
    func showHeroDetail(hero: SuperHero, fromVC: UIViewController) {
        presenter.hero = hero
        guard let vc = self.presenter._view else { return }
        fromVC.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showSubDetailsForElement(_ data: JSON) {
        guard   let subDetailRouter = AppModules.HeroSubDetails.build().router as? HeroSubDetailsRouter,
            let vc = self.presenter._view else { return }
        
        subDetailRouter.showSubDetailsForElement(data: data, fromVC: vc)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HeroDetailRouter {
    var presenter: HeroDetailPresenter {
        return _presenter as! HeroDetailPresenter
    }
}
