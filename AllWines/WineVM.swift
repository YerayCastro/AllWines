//
//  WineVM.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import Foundation


final class WineVM: ObservableObject {
    let network: DataInteractor
    @Published var redWines: [Wine] = []
    @Published var whiteWine: [Wine] = []
    @Published var roseWine: [Wine] = []
    @Published var sparklingWine: [Wine] = []
    @Published var favorites: [Wine] = []
    
    init(network: DataInteractor = Network()) {
        self.network = network
        Task {
            await getRedWine()
            await getWhiteWine()
            await getRoseWine()
            await getSparkilngWine()
        }
    }
    
    func getRedWine() async {
        do {
            let reds = try await network.getRedsWines()
            await MainActor.run {
                self.redWines = reds
            }
        } catch {
            await MainActor.run {
                print(error.localizedDescription)
            }
        }
    }
    
    func getWhiteWine() async {
        do {
            let whits = try await network.getWhitesWines()
            await MainActor.run {
                self.whiteWine = whits
            }
        } catch {
            await MainActor.run {
                print(error.localizedDescription)
            }
        }
    }
    
    func getRoseWine() async {
        do {
            let ros = try await network.getRosesWines()
            await MainActor.run {
                self.roseWine = ros
            }
        } catch {
            await MainActor.run {
                print(error.localizedDescription)
            }
        }
    }
    
    func getSparkilngWine() async {
        do {
            let sparks = try await network.getSparklingWines()
            await MainActor.run {
                self.sparklingWine = sparks
            }
        } catch {
            await MainActor.run {
                print(error.localizedDescription)
            }
        }
    }
    
    func saveFavoritesToFile() {
        do {
            let data = try JSONEncoder().encode(favorites)
            let fileURL = getDocumentsDirectory().appendingPathComponent("miswines.json")
            try data.write(to: fileURL, options: .atomicWrite)
        } catch {
            print("Error al guardar los favoritos: \(error)")
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func addToFavorites(wine: Wine) {
        if !favorites.contains(where: { $0.id == wine.id }) {
            favorites.append(wine)
            saveFavoritesToFile()
        }
    }
    
    func removeFromFavorites(wineToRemove: Wine) {
            if let index = favorites.firstIndex(where: { $0.id == wineToRemove.id }) {
                favorites.remove(at: index)
                saveFavoritesToFile()
            }
    }
    
    func loadFavoritesFromFile() {
        let fileURL = getDocumentsDirectory().appendingPathComponent("miswines.json")
        if let data = try? Data(contentsOf: fileURL) {
            favorites = (try? JSONDecoder().decode([Wine].self, from: data)) ?? []
        }
    }
}
