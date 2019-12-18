//
//  Dog.swift
//  SearchDogsApp
//
//  Created by casandra grullon on 12/18/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct Dog: Decodable {
    let weight: Weight
    let height: Height
    let id: Int
    let name: String
    let breedFor: String
    let group: String
    let lifeSpan: String
    let temperment: String
    let origin: String
    
    private enum CodingKeys: String, CodingKey {
        case weight
        case height
        case id
        case name
        case breedFor = "breed_for"
        case group = "breed_group"
        case lifeSpan = "life_span"
        case temperment
        case origin
    }
}
struct Weight: Decodable {
    let imperial: String
    let metric: String
}
struct Height: Decodable {
    let imperial: String
    let metric: String
}
