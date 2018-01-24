//
//  HeroesCollectionPresenter.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 22/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit
import SwiftyJSON

class HeroesCollectionPresenter: Presenter {
    
    func getSuperHeroes(updateUI: @escaping ObjectClosure<[SuperHero]>, failFetchSuperHeroes: @escaping RequestErrorBlock) {
        
        interactor.getSuperHeroes(successBlock: { response in
            if let response = response {
                let data = response["data"]
                guard let results: [JSON] = data["results"].array else { return }
                
                if results.count > 0 {
                    var superHeroes: [SuperHero] = []
                    for result in results {
                        let superHero = SuperHero()
                        superHero.parseSuperHero(data: result)
                        superHeroes.append(superHero)
                    }
                    updateUI(superHeroes)
                } else {
                    failFetchSuperHeroes(APIError())
                }
            }
        }) { error in
            failFetchSuperHeroes(error)
        }
    }
    
    func onHeroTapped(_ hero: SuperHero) {
        router.showHeroDetail(hero)
    }
    
    func filterChosen(filter: String, setFilter: @escaping ObjectClosure<[SuperHero]>, failFetchSuperHeroes: @escaping RequestErrorBlock) {
        router.showFilterScreen(filter: filter, setFilter: setFilter, failFetchSuperHeroes: failFetchSuperHeroes)
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HeroesCollectionPresenter {
    var view: HeroesCollectionViewInterface {
        return _view as! HeroesCollectionViewInterface
    }
    var interactor: HeroesCollectionInteractor {
        return _interactor as! HeroesCollectionInteractor
    }
    var router: HeroesCollectionRouter {
        return _router as! HeroesCollectionRouter
    }
}
