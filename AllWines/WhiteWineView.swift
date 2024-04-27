//
//  WhiteWineView.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

struct WhiteWineView: View {
    @EnvironmentObject var vm: WineVM
    var body: some View {
        NavigationStack {
            List(vm.whiteWine) { whiteWine in
                NavigationLink(value: whiteWine) {
                    Label(whiteWine.wine, systemImage: "tag.circle")
                }
            }
            .navigationTitle("Whites Wines")
            .navigationDestination(for: Wine.self) { whiteWine in
                WhiteWineDetailView(whiteWine: whiteWine)
            }
        }
    }
}

#Preview {
    NavigationStack {
        WhiteWineView()
            .environmentObject(WineVM.test2)
    }
}
