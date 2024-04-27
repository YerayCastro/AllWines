//
//  RoseWineDetailView.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

struct RoseWineDetailView: View {
    @EnvironmentObject var vm: WineVM
    @Environment(\.dismiss) var dismiss
    let roseWine: Wine
    var body: some View {
        ScrollView {
            ImageWineView(wine: roseWine)
            LazyVStack {
                ForEach(WineProperty.allCases, id: \.self) { property in
                    HStack {
                        property.systemImage
                            .imageScale(.large)
                        Text("\(property.rawValue)")
                        Spacer()
                        Text(property.value(from: roseWine))
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .tint(.primary)
                }
            }
            .navigationTitle(roseWine.wine)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        Task {
                            vm.addToFavorites(wine: roseWine)
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        RoseWineDetailView(roseWine: .test3)
            .environmentObject(WineVM.test3)
    }
}
