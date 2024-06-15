//
//  StarSelectingView.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

import SwiftUI
import SwiftData

struct StarSelectingView: View {
    @Query var items: [Item]
    
    @Binding var selectedIndex: Int
    @Binding var showRegisterSheet: Bool
    @Binding var isButtonDisabled: Bool
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(0..<4, id: \.self) { index in
                VStack(spacing: 24) {
                    Button {
                        showRegisterSheet = true
                        selectedIndex = index
                    } label: {
                        ZStack {
                            Image(StringLiterals.StarImage.allCases[index].rawValue)
                                .resizable()
                                .scaledToFit()
                                
                            Image(.plus)
                        }
                    }
                    .frame(width: 160, height: 160)
                    .disabled(isButtonDisabled)
                    
                    Text(items.first?.starName[index] ?? "Error")
                        .font(.title3)
                        .bold()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .tint(.black)
        .animation(.snappy, value: selectedIndex)
        .frame(height: 350)
    }
}

//
//#Preview {
//    StarSelectingView()
//}
