//
//  FavoritesView.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var vm: WineVM
    
    
    
    var body: some View {
        NavigationStack {
            List(vm.favorites) { favorite in
                FavoritesCellView(wine: favorite)
                    
            }
            
            .onAppear {
                vm.loadFavoritesFromFile()
            }
            .navigationTitle("Favorites Wines")
        }
    }
}


#Preview {
    NavigationStack {
        FavoritesView()
            .environmentObject(WineVM.test)
    }
}
