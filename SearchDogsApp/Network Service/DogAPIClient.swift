//
//  DogAPIClient.swift
//  SearchDogsApp
//
//  Created by casandra grullon on 12/18/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct DogAPIClient {
    static func getDogs(for search: String, completion: @escaping (Result<[Dog], AppError>) -> () ) {
        
        let endpointURL = "https://api.TheDogAPI.com/v1/breeds/search?q=\(search)"
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let dogs = try JSONDecoder().decode([Dog].self, from: data)
                    completion(.success(dogs))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
}
