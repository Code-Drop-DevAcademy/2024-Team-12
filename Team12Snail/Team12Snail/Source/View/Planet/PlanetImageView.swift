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
    
    var characterSize: CGFloat
    var characterPosition: CGFloat
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image(items.first?.selectedItems[3] ?? "")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                Image(items.first?.selectedItems[2] ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 514, height: 514)
                    .clipped()
                    .offset(y: 260)
                Image(items.first?.selectedItems[1] ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .offset(x: 110, y: 20)
                Image("PersonWith\(items.first?.selectedItems[0] ?? "")")
                    .resizable()
                    .scaledToFit()
                    .frame(height: characterSize)
                    .offset(y: characterPosition)
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
        
    }
}
//
//#Preview {
//    PlanetImageView()
//}
