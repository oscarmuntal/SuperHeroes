//
//  HeroDetailView.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 23/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit
import SwiftyJSON

//MARK: - Public Interface Protocol
protocol HeroDetailViewInterface {
}

//MARK: HeroDetailView Class
final class HeroDetailView: UserInterface {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

//MARK: - Private methods
extension HeroDetailView {
    
    fileprivate func setUI() {
        title  = presenter.hero?.name
        registerCells()
        removeExtraRows()
    }
    
    fileprivate func registerCells() {
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        tableView.register(UINib(nibName: "TextTableViewCell", bundle: nil), forCellReuseIdentifier: "TextTableViewCell")
        tableView.register(UINib(nibName: "BasicTableViewCell", bundle: nil), forCellReuseIdentifier: "BasicTableViewCell")
    }
    
    fileprivate func removeExtraRows() {
        tableView.tableFooterView = UIView()
    }
}

extension HeroDetailView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > displayData.mandatoryRows {
            let position = indexPath.row - displayData.mandatoryRows
            if let details = presenter.hero?.details {
                let element = details[position]
                presenter.showSubDetailsForElement(element)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfDetails = presenter.hero?.details?.count else { return displayData.mandatoryRows }
        return numberOfDetails + displayData.mandatoryRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: displayData.imageTableViewCell, for: indexPath as IndexPath) as! ImageTableViewCell
            guard let hero = presenter.hero else { return cell }
            cell.configure(superHero: hero)
            return cell
            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: displayData.textTableViewCell, for: indexPath as IndexPath) as! TextTableViewCell
            guard let hero = presenter.hero else { return cell }
            cell.configure(superHero: hero)
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: displayData.basicTableViewCell, for: indexPath as IndexPath) as! BasicTableViewCell
            guard let hero = presenter.hero else { return cell }
            cell.configure(superHero: hero, indexPath: indexPath)
            return cell
        }
        
    }

}

//MARK: - Public interface
extension HeroDetailView: HeroDetailViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HeroDetailView {
    var presenter: HeroDetailPresenter {
        return _presenter as! HeroDetailPresenter
    }
    var displayData: HeroDetailDisplayData {
        return _displayData as! HeroDetailDisplayData
    }
}
