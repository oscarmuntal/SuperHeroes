//
//  FilterScreenPresenter.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 24/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit
import SwiftyJSON

class FilterScreenPresenter: Presenter {
    
    var filter: String?
    var setFilter: ObjectClosure<[SuperHero]>?
    
    func getFilterData(path: ApiManager.kAPI_ENDPOINT, updateUI: @escaping ObjectClosure<[FilterItem]>, failFetchFilterData: @escaping RequestErrorBlock) {
        
            interactor.getFilterData(path: path, successBlock: { response in
                if let response = response {
                    let data = response["data"]
                    guard let results: [JSON] = data["results"].array else { return }

                    if results.count > 0 {
                        var filterItems: [FilterItem] = []
                        for result in results {
                            let filterItem = FilterItem()
                            filterItem.parseFilterItem(data: result)
                            filterItems.append(filterItem)
                        }
                        updateUI(filterItems)
                    } else {
                        failFetchFilterData(APIError())
                    }
                }
            }) { error in
                failFetchFilterData(error)
            }
    }
    
    func getHeroesFiltered(path: ApiManager.kAPI_ENDPOINT, id: Int, failFetchSuperHeroes: @escaping RequestErrorBlock) {
        let path2 = "/\(id)/characters"
        interactor.getHeroesFiltered(path: path, path2: path2, successBlock: { response in
            
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
                    self.setFilter!(superHeroes)
                } else {
                    self.setFilter!([])
                }
            }
        }) { error in
            failFetchSuperHeroes(error)
        }
    }
    
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
