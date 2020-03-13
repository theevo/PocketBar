//
//  DrinkError.swift
//  PocketBar
//
//  Created by theevo on 3/12/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import Foundation

enum DrinkError: LocalizedError {
    case thrown(Error)
    case invalidURL
    case noData
    case badData
    case failToDelete
    
    var errorDescription: String? {
        switch self {
            
        case .thrown(let error):
            return error.localizedDescription
        case .invalidURL:
            return "Unable to reach server."
        case .noData:
            return "Server responded with no data."
        case .badData:
            return "Server returned bad data."
        case .failToDelete:
            return "Delete failed."
        }
    } // end errorDescription
} // end enum
