//
//  FilterScreenRouter.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 24/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class FilterScreenRouter: Router {
    
    func showFilterScreen(filter: String, fromVC: UIViewController, setFilter: @escaping ObjectClosure<[SuperHero]>, failFetchSuperHeroes: @escaping RequestErrorBlock) {
        presenter.filter = filter
        presenter.setFilter = setFilter
        guard let vc = self.presenter._view else { return }
        fromVC.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension FilterScreenRouter {
    var presenter: FilterScreenPresenter {
        return _presenter as! FilterScreenPresenter
    }
}
