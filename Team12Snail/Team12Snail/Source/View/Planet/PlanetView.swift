//
//  PlanetView.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

import SwiftUI

struct PlanetView: View {
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            PlanetImage
            StarSelectingView(selectedIndex: $selectedIndex)
                .padding(.bottom, 30)
                .overlay {
                   ChangeStarButton
                }
        }
        .overlay(alignment: .topTrailing) {
            ShoppingButton
                .padding()
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
    
    var ChangeStarButton: some View {
        HStack {
            Button {
                if selectedIndex > 0 {
                    selectedIndex -= 1
                }
                print(selectedIndex)
            } label: {
                Image(systemName: "chevron.left")
                    .font(.largeTitle)
                    .shadow(radius: 4, y: 4)
            }
            .tint(.white)
            Spacer()
            Button {
                if selectedIndex < 3 {
                    selectedIndex += 1
                }
            } label: {
                Image(systemName: "chevron.right")
                    .font(.largeTitle)
                    .shadow(radius: 4, y: 4)
            }
            .tint(.white)
        }
        .padding(16)
    }
    
    var ShoppingButton: some View {
        Button {
            print("move To shop")
        } label: {
            Image(systemName: "storefront.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    PlanetView()
}
