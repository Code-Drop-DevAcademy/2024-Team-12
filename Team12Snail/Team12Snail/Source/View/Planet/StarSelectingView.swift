//
//  StarSelectingView.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

import SwiftUI

struct StarSelectingView: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(0..<4, id: \.self) { index in
                VStack(spacing: 24) {
                    Button {
                        print("show TaskView \(index)")
                    } label: {
                        ZStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                
                            Image(systemName: "plus")
                                .resizable()
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .frame(width: 40, height: 40)
                                .offset(y: 5)
                        }
                    }
                    .frame(width: 160, height: 160)
                    
                    Text("마케팅 실습 향상")
                        .font(.title3)
                        .bold()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .animation(.snappy, value: selectedIndex)
        .frame(height: UIScreen.main.bounds.height/2)
    }
}

//
//#Preview {
//    StarSelectingView()
//}
