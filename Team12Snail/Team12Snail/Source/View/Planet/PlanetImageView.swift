//
//  PlanetImageView.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

import SwiftUI
import SwiftData

struct PlanetImageView: View {
    @Query var items: [Item]
    
    var body: some View {
        ZStack {
            Image(items.first?.selectedItems[3] ?? "")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            Image(items.first?.selectedItems[2] ?? "")
                .resizable()
                .scaledToFit()
                .frame(width: 514, height: 514)
                .clipped()
                .offset(y: 260)
            Image(items.first?.selectedItems[1] ?? "")
                .offset(x: 110)
            Image(items.first?.selectedItems[0] ?? "")
                .offset(y: -110)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

#Preview {
    PlanetImageView()
}
