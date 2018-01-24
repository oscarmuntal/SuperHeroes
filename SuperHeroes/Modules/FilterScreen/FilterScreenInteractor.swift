//
//  FilterScreenInteractor.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 24/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class FilterScreenInteractor: Interactor {
    
    func getFilterData(path: ApiManager.kAPI_ENDPOINT, successBlock: @escaping RequestSuccessBlock, errorBlock: @escaping RequestErrorBlock) {
        ApiManager.sharedInstance.get(path: path, path2: "", successBlock: { response in
            if let response = response {
                successBlock(response)
            } else {
                errorBlock(APIError())
            }
        }) { error in
            errorBlock(error)
        }
    }
    
    func getHeroesFiltered(path: ApiManager.kAPI_ENDPOINT, path2: String, successBlock: @escaping RequestSuccessBlock, errorBlock: @escaping RequestErrorBlock) {
        ApiManager.sharedInstance.get(path: path, path2: path2, successBlock: { response in
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
private extension FilterScreenInteractor {
    var presenter: FilterScreenPresenter {
        return _presenter as! FilterScreenPresenter
    }
}
