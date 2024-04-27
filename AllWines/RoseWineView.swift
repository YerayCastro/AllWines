//
//  RoseWineView.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

struct RoseWineView: View {
    @EnvironmentObject var vm: WineVM
    var body: some View {
        NavigationStack {
            List(vm.roseWine) { roseWine in
                NavigationLink(value: roseWine) {
                    Label(roseWine.wine, systemImage: "tag.square")
                }
            }
            .navigationDestination(for: Wine.self) { roseWine in
                RoseWineDetailView(roseWine: roseWine)
            }
            .navigationTitle("Roses Wines")
        }
    }
}

#Preview {
    NavigationStack {
        RoseWineView()
            .environmentObject(WineVM.test3)
    }
}
