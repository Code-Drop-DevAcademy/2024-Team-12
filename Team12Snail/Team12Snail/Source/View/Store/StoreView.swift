//
//  StoreView.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

import SwiftUI

struct StoreView: View {
    @State private var storeItems: [StoreItem] = [
        StoreItem(index: 0, imageName: "Default", price: 14),
        StoreItem(index: 0, imageName: "Glasses", price: 5),
        StoreItem(index: 0, imageName: "Suit", price: 17),
        StoreItem(index: 1, imageName: "Cat", price: 17),
        StoreItem(index: 1, imageName: "Fly", price: 24),
        StoreItem(index: 1, imageName: "Snake", price: 21),
        StoreItem(index: 2, imageName: "DefaultPlanet", price: 14),
        StoreItem(index: 2, imageName: "NewPlanet", price: 4),
        StoreItem(index: 3, imageName: "DefaultBackground", price: 33),
        StoreItem(index: 3, imageName: "NewBackground", price: 29)
    ]
    
    @State private var selectedCategory: Int = 0
    @Bindable var items: Item
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ZStack {
                    PlanetImageView(characterSize: 150, characterPosition: -60)
                        .frame(width: geo.size.width, height: geo.size.height / 2)
                        .mask {
                            Rectangle()
                                .frame(width: 361, height: 358)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                        }
                        .overlay {
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 361, height: 358)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .overlay { RoundedRectangle(cornerRadius: 25).fill(.clear).stroke(.black) }
                        }
                }
                StoreDetailView(selectedCategory: $selectedCategory, storeItems: $storeItems, item: items)
            }
        }
    }
}

struct StoreDetailView: View {
    @Binding var selectedCategory: Int
    //    @Binding var storeItems: [Int:[String]]
    @Binding var storeItems: [StoreItem]
    @Bindable var item: Item
    @State private var showingBuyAlerts: Bool = false
    @State private var showingCantBuyAlerts: Bool = false
    @State private var willBuyItemName: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                Text("내 별사탕").padding(.trailing, 7).font(.system(size: 15, weight: .semibold))
                Image(indexToStarImage(to: selectedCategory)).resizable().scaledToFit().frame(width: 15).padding(.trailing, 2)
                Text("\(item.starPoint[selectedCategory] ?? 0)").padding(.trailing, 16).font(.system(size: 17, weight: .bold))
            }
            .padding(.top, 8)
            HStack(spacing: 0) {
                Spacer().frame(width: 16)
                ForEach(0..<4) { index in
                    Spacer().frame(width: 3)
                    Capsule()
                        .fill(.clear)
                        .frame(height: 32)
                        .overlay {
                            Capsule().stroke(.black)
                            HStack {
                                Image(indexToStarImage(to: index)).resizable().scaledToFit().frame(width: 15)
                                Text(indexToCategory(to: index)).font(.system(size: 13, weight: .semibold)).padding(.leading, -3)
                            }
                        }
                        .onTapGesture {
                            selectedCategory = index
                        }
                        .opacity(selectedCategory == index ? 1.0 : 0.3)
                    Spacer().frame(width: 3)
                }
                Spacer().frame(width: 16)
            }
            .padding(.top, 10)
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 30) {
                    let values = storeItems.filter({ $0.index == selectedCategory })
                    ForEach(values, id: \.self) { value in
                        let purchased = item.purchasedItems[selectedCategory]?.contains(value.imageName) ?? false
                        let selected = item.selectedItems[selectedCategory] == value.imageName
                        VStack {
                            Image(value.imageName).resizable().scaledToFit().frame(width: 60, height: 60)
                            HStack {
                                if selected {
                                    Text("적용 중").font(.system(size: 15, weight: .semibold))
                                } else if purchased {
                                    Text("보유 중").font(.system(size: 15, weight: .semibold))
                                } else {
                                    Image(indexToStarImage(to: selectedCategory)).resizable().scaledToFit().frame(width: 15)
                                    Text("\(value.price)").font(.system(size: 15, weight: .semibold))
                                }
                            }
                        }
                        .onTapGesture {
                            print(value)
                            if !purchased {
                                // "아직 구매하지 않았다면"
                                // 구매 팝업 띄우기
                                if item.starPoint[selectedCategory]! <= value.price {
                                    showingBuyAlerts = true
                                    willBuyItemName = value.imageName
                                }
                            } else if purchased {
                                // "구매했다면 선택되게"
                                item.selectedItems[selectedCategory]! = "\(value.imageName)"
                                print("선택 완료")
                            }
                        }
                        .alert("구매하기", isPresented: $showingBuyAlerts) {
                            Button("취소") { }
                            Button("구매") {
                                item.purchasedItems[selectedCategory]?.append("\(willBuyItemName)")
                                print(willBuyItemName)
                                print("구매 완료")
                            }
                        } message: {
                            Text("이 요소를 구매하시겠습니까?")
                        }
                    }
                }
                .padding()
            }
            .scrollIndicators(.never)
        }
        .navigationTitle("스토어")
    }
}

func indexToCategory(to index: Int) -> String {
    switch index {
    case 0:
        return "캐릭터"
    case 1:
        return "액세서리"
    case 2:
        return "행성"
    case 3:
        return "배경"
    default:
        return ""
    }
}

func indexToStarImage(to index: Int) -> String {
    switch index {
    case 0:
        return "GreenStar"
    case 1:
        return "OrangeStar"
    case 2:
        return "YellowStar"
    case 3:
        return "PinkStar"
    default:
        return ""
    }
}

#Preview {
    StoreView(items: Item(starName: [:], starPoint: [:], selectedItems: [:], purchasedItems: [:]))
}
