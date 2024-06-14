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
                        StoreView(items: items.first!)
                    }
            }
            .onAppear {
                // 현재는 임시로 뷰 생성시 Items 임의로 생성되게 설정
                if items.isEmpty {
                    initItems()
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

extension PlanetView {
    
    // 원래는 온보딩 뷰에서 불러와야하는 메소드
    func initItems() {
        let item = Item(
            starName: [0:"첫번째", 1:"두번째", 2:"세번째", 3:"네번째"],
            starPoint: [0:0, 1:0, 2:0, 3:0],
            selectedItems: [0 : "pencil", 1 : "eraser", 2 : "paperplane.fill", 3 : "doc.fill"],
            purchasedItems: [
                0 : [],
                1 : [],
                2 : [],
                3 : []
            ])
        modelContext.insert(item)
        
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
