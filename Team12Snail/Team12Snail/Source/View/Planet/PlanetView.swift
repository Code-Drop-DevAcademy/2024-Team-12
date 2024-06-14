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
    
    @State private var selectedIndex: Int = 0
    @State private var showRegisterSheet: Bool = false
    @State private var showTimer: Bool = false
    @State private var taskTitleText: String = ""
    @State private var taskCase: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                PlanetImage
                if showTimer {
                    StopWatchView()
                } else {
                    StarSelectingView(selectedIndex: $selectedIndex, showRegisterSheet: $showRegisterSheet)
                        .padding(.bottom, 30)
                        .overlay {
                            ChangeStarButton
                        }
                }
            }
            .overlay(alignment: .topTrailing) {
                ShoppingButton
                    .padding()
                    .padding(.top, 24)
            }
            .onAppear {
                // 현재는 임시로 뷰 생성시 Items 임의로 생성되게 설정
                if items.isEmpty {
                    initItems()
                }
            }
            .sheet(isPresented: $showRegisterSheet) {
                TaskRegisterView(selectedIndex: $selectedIndex,
                                 showTimer: $showTimer,
                                 taskTitleText: $taskTitleText,
                                 taskCase: $taskCase)
            }
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
                    .padding()
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
                    .padding()
            }
            .tint(.white)
        }
        .padding(8)
    }
    
    var ShoppingButton: some View {
        Button {
            print("move To shop")
        } label: {
            Image(systemName: "storefront.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(.black)
                .padding(8)
        }
    }
}

//#Preview {
//    PlanetView()
//}

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
