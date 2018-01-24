//
//  FilterScreenView.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 24/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol FilterScreenViewInterface {
}

//MARK: FilterScreenView Class
final class FilterScreenView: UserInterface {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var filterItems: [FilterItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter.filter
        self.showLoader()
        presenter.getFilterData(path: displayData.getPathFromFilter(presenter.filter!), updateUI: { items in
            self.setupUI(items)
            
        }) { error in
            //TODO: use error from API
        }

    }
}

extension FilterScreenView {
    
    fileprivate func setupUI(_ items: [FilterItem]) {
        removeExtraRows()
        for item in items {
            self.filterItems.append(item)
        }
        self.tableView.reloadData()
        self.hideLoader()
    }
    
    fileprivate func removeExtraRows() {
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func showLoader() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    private func hideLoader() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}

extension FilterScreenView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard   let filter = presenter.filter,
                let id = filterItems[indexPath.row].id else { return }
        
        let path = displayData.getPathFromFilter(filter)
        presenter.getHeroesFiltered(path: path, id: id) { error in
            //TODO: use error from API
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filterItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: displayData.reuseIdentifier, for: indexPath as IndexPath)
        cell.textLabel?.text = self.filterItems[indexPath.row].name
        return cell
    }
}

//MARK: - Public interface
extension FilterScreenView: FilterScreenViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension FilterScreenView {
    var presenter: FilterScreenPresenter {
        return _presenter as! FilterScreenPresenter
    }
    var displayData: FilterScreenDisplayData {
        return _displayData as! FilterScreenDisplayData
    }
}
