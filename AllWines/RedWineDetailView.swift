//
//  RedWineDetailView.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

struct RedWineDetailView: View {
    @EnvironmentObject var vm: WineVM
    @Environment(\.dismiss) var dismiss
    let redWine: Wine
    
    var body: some View {
        ScrollView {
            ImageWineView(wine: redWine)
            LazyVStack {
                ForEach(WineProperty.allCases, id: \.self) { property in
                    HStack {
                        property.systemImage
                            .imageScale(.large)
                        Text(property.rawValue)
                        Spacer()
                            Text(property.value(from: redWine))
                                .foregroundStyle(.secondary)
                            
                        }
                        .padding()
                        .tint(.primary)
                    }
                }
                .navigationTitle(redWine.wine)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        Button {
                            Task {
                                vm.addToFavorites(wine: redWine)
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
        RedWineDetailView(redWine: .test)
            .environmentObject(WineVM.test)
    }
}

