//
//  DrinkListTableViewController.swift
//  PocketBar
//
//  Created by theevo on 3/12/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import UIKit

class DrinkListTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var drinks: [Drink] = []
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var drinkSearchBar: UISearchBar!
    
    
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinkSearchBar.delegate = self
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return drinks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as? DrinkTableViewCell else { return UITableViewCell() }
        
        let drink = drinks[indexPath.row]
        
        cell.drink = drink
        
        return cell
    }
    
} // end DrinkListTableViewController

extension DrinkListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text,
            !searchTerm.isEmpty else { return }
        
        DrinkController.fetchDrinks(searchTerm: searchTerm) { (result) in
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let drinksArray):
                    self.drinks = drinksArray
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error, error.localizedDescription)
                }
            } // end DispatchQueue
        } // end fetchDrinks
    } // end func
} // end extension
