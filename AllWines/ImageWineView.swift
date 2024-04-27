//
//  ImageWineView.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

struct ImageWineView: View {
    let wine: Wine
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color(.gray).opacity(0.3))
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .padding()
            .blur(radius: 3.0, opaque: false)
            .overlay {
                if let urlImage = URL(string: wine.image) {
                    AsyncImage(url: urlImage) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame( height: 300)
                            .padding()
                    } placeholder: {
                        ProgressView()
                            .imageScale(.large)
                            .tint(.black)
                    }
                }
            }
    }
}

#Preview {
    ImageWineView(wine: .test)
}
