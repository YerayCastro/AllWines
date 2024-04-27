//
//  RedWine.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import Foundation


// MARK: - RedWine
struct Wine: Codable, Hashable, Identifiable {
    let winery: String
    let wine: String
    let rating: Rating
    let location: String
    let image: String
    let id: Int
}

// MARK: - Rating
struct Rating: Codable, Hashable {
    let average: String
    let reviews: String
}
