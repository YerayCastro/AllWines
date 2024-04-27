//
//  MainView.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var vm: WineVM
    var body: some View {
        TabView {
            RedWineView()
                .tabItem { Label("Reds Wines", systemImage: "tag") }
            WhiteWineView()
                .tabItem { Label("Whites Wines", systemImage: "tag.circle") }
            RoseWineView()
                .tabItem { Label("Roses Wines", systemImage: "tag.square") }
            SparklingWineView()
                .tabItem { Label("Sparklings Wines", systemImage: "tag.slash.fill") }
            FavoritesView()
                .tabItem { Label("Favorites", systemImage: "star.fill") }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(WineVM.test)
}
