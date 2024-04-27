//
//  ContentView.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

struct RedWineView: View {
    @EnvironmentObject var vm: WineVM
    
    var body: some View {
        NavigationStack {
            List(vm.redWines) { redWine in
                NavigationLink(value: redWine) {
                    Label(redWine.wine, systemImage: "tag")
                }
            }
            .navigationTitle("Red Wines")
            .navigationDestination(for: Wine.self) { redWine in
                RedWineDetailView(redWine: redWine)
            }
        }
    }
}

#Preview {
    NavigationStack {
        RedWineView()
            .environmentObject(WineVM.test)
    }
}



