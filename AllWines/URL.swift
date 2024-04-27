//
//  URL.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import Foundation

let api = URL(string: "https://api.sampleapis.com/")!

extension URL {
    static let urlReds = api.appending(path: "wines/reds")
    static let urlWhites = api.appending(path: "wines/whites")
    static let urlRoses = api.appending(path: "wines/rose")
    static let urlSparklings = api.appending(path: "wines/sparkling")
}
