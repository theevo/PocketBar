//
//  DrinkTableViewCell.swift
//  PocketBar
//
//  Created by theevo on 3/12/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var drink: Drink? {
        didSet {
            guard let drink = drink else { return }
            drinkNameLabel.text = drink.name
            instructionsLabel.text = drink.instructions
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var drinkThumbnail: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    
    
    
    //    func updateUI() {
    //        guard let drink = drink else { return }
    //        drinkNameLabel.text = drink.name
    //        instructionsLabel.text = drink.instructions
    //    }
    
} // end class
