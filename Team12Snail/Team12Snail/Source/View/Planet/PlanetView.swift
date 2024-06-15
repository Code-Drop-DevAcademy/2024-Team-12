//
//  PlanetView.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

import SwiftUI
import SwiftData

struct PlanetView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var items: [Item]
    @State var selectedIndex: Int = 0
    @State private var selecttimer: Bool = false
    @State var moveNextView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                PlanetImage
                if selecttimer == false{
                    StarSelectingView(selectedIndex: $selectedIndex)
                        .padding(.bottom, 30)
                        .overlay {
                            ChangeStarButton
                        }
                }
                if selecttimer == true{
                    StopWatchView()
                }
            }
            .overlay(alignment: .topTrailing) {
                ShoppingButton
                    .padding()
                    .navigationDestination(isPresented: $moveNextView) {
                        StoreView(items: items.first ?? Item(starName: [:], starPoint: [:], selectedItems: [:], purchasedItems: [:]))
                    }
            }
        }
    }
}

extension StopWatchView {
    var StopWatchImage: some View{
        Image(.imageDummyPlanet)
            .resizable()
            .scaledToFill()
            .clipped()
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
            moveNextView = true
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
