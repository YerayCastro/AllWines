//
//  FavoritesCellView.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

struct FavoritesCellView: View {
    @EnvironmentObject var vm: WineVM
    @Environment(\.dismiss) var dismiss
    let wine: Wine
    var body: some View {
        LazyVStack(alignment: .leading) {
            HStack {
                Text(wine.wine)
                    .font(.subheadline)
                    .bold()
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("Rating")
                        .font(.subheadline)
                        .bold()
                    Text(wine.rating.average)
                        .font(.body)
                        .foregroundStyle(.secondary)
                    Image(systemName: "star.fill")
                        .imageScale(.small)
                        .foregroundStyle(.yellow)
                }
            }
            .swipeActions {
                Button {
                    withAnimation{
                        vm.removeFromFavorites(wineToRemove: wine)
                    }
                } label: {
                    Image(systemName: "trash")
                        .imageScale(.small)
                        .tint(.red)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FavoritesCellView(wine: .test)
            .environmentObject(WineVM.test)
    }
}
