//
//  Enums.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

enum WineProperty: String, CaseIterable {
    case winery
    case average
    case reviews
    case location
    

    var systemImage: Image {
        switch self {
        case .winery:
            return Image(systemName: "building.2.crop.circle")
        case .location:
            return Image(systemName: "map.fill")
        case .average:
            return Image(systemName: "star.fill")
        case .reviews:
            return Image(systemName: "hand.thumbsup.fill")
        }
    }
    
    func value(from wine: Wine) -> String {
            switch self {
            case .winery:
                return wine.winery
            case .location:
                return wine.location
            case .average:
                return wine.rating.average
            case .reviews:
                return wine.rating.reviews
            }
        }
}
