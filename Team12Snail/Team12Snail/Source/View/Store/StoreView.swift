//
//  StoreView.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

import SwiftUI

struct StoreView: View {
    @State private var storeItems: [Int : [String]] = [
        0 : ["a", "b", "c", "d", "e"],
        1 : ["b", "bc", "bd", "ba", "be"],
        2 : ["c", "cc", "cf", "cz", "cq"],
        3 : ["d", "dd", "dz", "dh", "dg"]
    ]
    @State private var selectedCategory: Int = 0
    @Bindable var items: Item
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    PlanetView().PlanetImage
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
                StoreDetailView(selectedCategory: $selectedCategory, storeItems: $storeItems, items: items)
            }
        }
    }
}

struct StoreDetailView: View {
    @Binding var selectedCategory: Int
    @Binding var storeItems: [Int:[String]]
    @Bindable var items: Item
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                ForEach(0..<4) { index in
                    Spacer()
                    Capsule()
                        .fill(selectedCategory == index ? .blue : .clear)
                        .frame(height: 32)
                        .overlay {
                            Capsule().stroke(.black)
                            HStack {
//                                Image(systemName: <#T##String#>)
                                Text(indexToCategory(to: index))
                            }
                        }
                        .onTapGesture {
                            selectedCategory = index
                        }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 10)
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                    if let values = storeItems[selectedCategory] {
                        ForEach(values.indices, id: \.self) { index in
                            let value = values[index]
                            let purchased = items.purchasedItems[selectedCategory]?.contains(value) ?? false
                            let selected = items.selectedItems[selectedCategory] == values[index]
                            Text(purchased ? "보유중" : value)
                                .frame(width: 75, height: 100)
                                .background(selected ? .blue : .white)
                                .cornerRadius(8)
                                .shadow(radius: 2)
                                .onTapGesture {
                                    if !purchased {
                                        // "아직 구매하지 않았다면"
                                        // 구매 팝업 띄우기
                                        items.purchasedItems[selectedCategory]?.append(value)
                                        print("구매 완료")
                                    } else if purchased {
                                        // "구매했다면 선택되게"
                                        items.selectedItems[selectedCategory]! = values[index]
                                        print("선택 완료")
                                    }
                                }
                        }
                    }
                }
                .padding()
            }
            .scrollIndicators(.never)
        }
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

#Preview {
    StoreView(items: Item(starName: [:], starPoint: [:], selectedItems: [:], purchasedItems: [:]))
}
