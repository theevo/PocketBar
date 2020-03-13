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
            
            DrinkController.fetchThumbnail(for: drink) { (result) in
                DispatchQueue.main.async {
                    switch result {
                        
                    case .success(let thumbnail):
                        self.drinkThumbnail.image = thumbnail
                    case .failure(let error):
                        print(error, error.localizedDescription)
                    }
                } // end DispatchQueue
            } // end fetchThumbnail
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var drinkThumbnail: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
} // end class
