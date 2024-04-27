//
//  DataTest.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import Foundation

struct DataTest: DataInteractor {
    let urlRed = Bundle.main.url(forResource: "testRedWines", withExtension: "json")!
    let urlWhite = Bundle.main.url(forResource: "testWhiteWines", withExtension: "json")!
    let urlRose = Bundle.main.url(forResource: "testRoseWines", withExtension: "json")!
    let urlSparkling = Bundle.main.url(forResource: "testSparklingWines", withExtension: "json")!
    
    func getRedsWines() async throws -> [Wine] {
        let data = try Data(contentsOf: urlRed)
        return try JSONDecoder().decode([Wine].self, from: data)
    }
    
    func getWhitesWines() async throws -> [Wine] {
        let data = try Data(contentsOf: urlWhite)
        return try JSONDecoder().decode([Wine].self, from: data)
    }
    
    func getRosesWines() async throws -> [Wine] {
        let data = try Data(contentsOf: urlRose)
        return try JSONDecoder().decode([Wine].self, from: data)
    }
    
    func getSparklingWines() async throws -> [Wine] {
        let data = try Data(contentsOf: urlSparkling)
        return try JSONDecoder().decode([Wine].self, from: data)
    }
}

extension WineVM {
    static let test = WineVM(network: DataTest())
}

extension Wine {
    static let test = Wine(
        winery: "Masseto",
        wine: "Toscana 2011",
        rating: Rating(
            average: "4.7",
            reviews: "546 ratings"
        ),
        location: "Italy\n·\nToscana",
        image: "https://images.vivino.com/thumbs/GPvEr_IUSKS1CDhhsY1ySg_pb_x300.png",
        id: 716
    )
}

extension WineVM {
    static let test2 = WineVM(network: DataTest())
}
extension Wine {
    static let test2 = Wine(
        winery: "Domaine de La Romanée-Conti",
        wine: "Montrachet Grand Cru 2010",
        rating: Rating(
            average: "4.9",
            reviews: "37 ratings"
        ),
        location: "France\n·\nMontrachet Grand Cru",
        image: "https://images.vivino.com/thumbs/rORmihtxSrKG7SfuI0bD6w_pb_x300.png",
        id: 1
    )
}

extension WineVM {
    static let test3 = WineVM(network: DataTest())
}

extension Wine {
    static let test3 = Wine(
        winery: "Antica Terra",
        wine: "Angelicall Rosé 2014",
        rating: Rating(
            average: "4.7",
            reviews: "33 ratings"
        ),
        location: "United States\n·\nWillamette Valley",
        image: "https://images.vivino.com/thumbs/LRmcfSasTD22xR6lRSKcIw_pb_x300.png",
        id: 1
    )
}

extension WineVM {
    static let test4 = WineVM(network: DataTest())
}
extension Wine {
    static let test4 = Wine(
        winery: "Krug",
        wine: "Clos d'Ambonnay Blanc de Noirs Brut Champagne 1995",
        rating: Rating(
            average: "4.9",
            reviews: "92 ratings"
        ),
        location: "France\n·\nChampagne",
        image: "https://images.vivino.com/thumbs/DPq0ayGPR4SBeTDsYzLiiA_pb_x300.png",
        id: 1
    )
}
