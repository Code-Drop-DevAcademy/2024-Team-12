//
//  PlanetView.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

import SwiftUI

struct PlanetView: View {
    var body: some View {
        ZStack {
            PlanetImage
        }
    }
}


extension PlanetView {
    var PlanetImage: some View {
        Image(.imageDummyPlanet)
            .resizable()
            .scaledToFill()
            .clipped()
    }
}

#Preview {
    PlanetView()
}
