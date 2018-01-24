//
//  HeroSubDetailsView.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 24/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit
import SwiftyJSON

//MARK: - Public Interface Protocol
protocol HeroSubDetailsViewInterface {
}

//MARK: HeroSubDetailsView Class
final class HeroSubDetailsView: UserInterface {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        if let data = presenter.data {
            title = data["key"].stringValue
        }
        removeExtraRows()
    }
}

extension HeroSubDetailsView {
    
    fileprivate func removeExtraRows() {
        tableView.tableFooterView = UIView()
    }
}

extension HeroSubDetailsView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = presenter.data else { return 0 }
        return data["value"].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: displayData.reuseIdentifier, for: indexPath as IndexPath) as! UITableViewCell
        if  let data = presenter.data,
            let elements = data["value"].array {
            let element = elements[indexPath.row]
            cell.textLabel?.text = element[displayData.key(data)].stringValue
        }
        return cell
    }
    
}

//MARK: - Public interface
extension HeroSubDetailsView: HeroSubDetailsViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HeroSubDetailsView {
    var presenter: HeroSubDetailsPresenter {
        return _presenter as! HeroSubDetailsPresenter
    }
    var displayData: HeroSubDetailsDisplayData {
        return _displayData as! HeroSubDetailsDisplayData
    }
}
