//
//  DrinkController.swift
//  PocketBar
//
//  Created by theevo on 3/12/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import UIKit

class DrinkController {
    
    
    // MARK: - Private Properties
    
    static private let baseURL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php")
    static private let searchQueryKey = "s"
    static private let apiEndpoint = "api/json"
    static private let versionEndpoint = "v1/1"
    static private let searchEndpoint = "search"
    static private let phpExtension = "php"
    
    
    // MARK: - Functions
    
    static func fetchDrinks( searchTerm: String,
                             completion: @escaping (Result<[Drink], DrinkError>) -> Void) {
        
        // 1) URL
        guard let baseURL = baseURL
            else { return completion(.failure(.invalidURL)) }
        
        // 1.1) components
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        urlComponents?.queryItems = [URLQueryItem(name: searchQueryKey, value: searchTerm)]
        
        guard let finalURL = urlComponents?.url else { return completion(.failure(.invalidURL)) }
        print(finalURL)
        
        // 2) DataTask
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            
            // 3) Error Handling
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
            // 4) Check for Data
            guard let data = data else {
                return completion(.failure(.noData))
            }
            
            // 5) Decode
            do {
                let drinkPackage = try JSONDecoder().decode(TopLevelObject.self, from: data)
                let drinks = drinkPackage.drinks
                return completion(.success(drinks))
                
            } catch {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
        }.resume()
        
    }
    
    static func fetchThumbnail(for drink: Drink,
                               completion: @escaping (Result<UIImage, DrinkError>) -> Void) {
        
        let thumbnailURL = drink.thumbnail
        print(thumbnailURL)
        
        URLSession.shared.dataTask(with: thumbnailURL) { (data, _, error) in
            
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.invalidURL))
            }
            
            guard let data = data else {
                return completion(.failure(.noData))
            }
            
            guard let thumbnail = UIImage(data: data) else { return completion(.failure(.badData)) }
            
            return completion(.success(thumbnail))
            
        }.resume()
    } // end fetchThumbnail
    
}
