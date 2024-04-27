//
//  SparklingWineView.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

struct SparklingWineView: View {
    @EnvironmentObject var vm: WineVM
    var body: some View {
        NavigationStack {
            List(vm.sparklingWine) { sparklingWine in
                NavigationLink(value: sparklingWine) {
                    Label(sparklingWine.wine, systemImage: "tag.slash.fill")
                }
                
            }
            .navigationDestination(for: Wine.self) { sparklingWine in
                SparklingWineDetailView(sparklingWine: sparklingWine)
            }
            .navigationTitle("Sparklings Wines")
        }
    }
}

#Preview {
    SparklingWineView()
        .environmentObject(WineVM.test4)
}
