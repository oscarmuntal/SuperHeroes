//
//  HeroDetailRouter.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 23/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class HeroDetailRouter: Router {
    
    func showHeroDetail(hero: SuperHero, fromVC: UIViewController) {
        presenter.hero = hero
        guard let vc = self.presenter._view else { return }
        fromVC.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HeroDetailRouter {
    var presenter: HeroDetailPresenter {
        return _presenter as! HeroDetailPresenter
    }
}
