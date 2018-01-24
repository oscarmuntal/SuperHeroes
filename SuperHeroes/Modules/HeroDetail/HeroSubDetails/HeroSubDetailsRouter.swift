//
//  HeroSubDetailsRouter.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 24/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit
import SwiftyJSON

class HeroSubDetailsRouter: Router {
    
    func showSubDetailsForElement(data: JSON, fromVC: UIViewController) {
        presenter.data = data
        guard let vc = self.presenter._view else { return }
        fromVC.show(vc, sender: nil)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HeroSubDetailsRouter {
    var presenter: HeroSubDetailsPresenter {
        return _presenter as! HeroSubDetailsPresenter
    }
}
