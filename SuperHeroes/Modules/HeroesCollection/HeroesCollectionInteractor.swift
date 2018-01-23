//
//  HeroesCollectionInteractor.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 22/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class HeroesCollectionInteractor: Interactor {
    
    func getSuperHeroes(successBlock: @escaping RequestSuccessBlock, errorBlock: @escaping RequestErrorBlock) {
        ApiManager.sharedInstance.get(path: .kAPI_ENDPOINT_GET_SUPERHEROES, successBlock: { response in
            if let response = response {
                successBlock(response)
            } else {
                errorBlock(APIError())
            }            
        }) { error in
            errorBlock(error)
        }
    }
    
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HeroesCollectionInteractor {
    var presenter: HeroesCollectionPresenter {
        return _presenter as! HeroesCollectionPresenter
    }
}
