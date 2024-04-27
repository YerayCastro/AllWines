//
//  SparklingWineDetailView.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

struct SparklingWineDetailView: View {
    @EnvironmentObject var vm: WineVM
    @Environment(\.dismiss) var dismiss
    let sparklingWine: Wine
    var body: some View {
        ScrollView {
            ImageWineView(wine: sparklingWine)
            LazyVStack {
                ForEach(WineProperty.allCases, id: \.self) { property in
                    HStack {
                        property.systemImage
                            .imageScale(.large)
                        Text("\(property.rawValue)")
                        Spacer()
                        Text(property.value(from: sparklingWine))
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .tint(.primary)
                }
            }
            .navigationTitle(sparklingWine.wine)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        Task {
                            vm.addToFavorites(wine: sparklingWine)
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
        SparklingWineDetailView(sparklingWine: .test4)
    }
}
