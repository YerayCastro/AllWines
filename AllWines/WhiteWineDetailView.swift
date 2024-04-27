//
//  WhiteWineDetailView.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

struct WhiteWineDetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: WineVM
    let whiteWine: Wine
    var body: some View {
        ScrollView {
            ImageWineView(wine: whiteWine)
            LazyVStack {
                ForEach(WineProperty.allCases, id: \.self) { property in
                    HStack {
                        property.systemImage
                            .imageScale(.large)
                        Text(property.rawValue)
                        Spacer()
                            Text(property.value(from: whiteWine))
                                .foregroundStyle(.secondary)
                    }
                    .padding()
                    .tint(.primary)
                }
            }
            .navigationTitle(whiteWine.wine)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        Task {
                            vm.addToFavorites(wine: whiteWine)
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
        WhiteWineDetailView(whiteWine: .test2)
            .environmentObject(WineVM.test2)
    }
}
