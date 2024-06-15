//
//  ContentView.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var isOnboarding: Bool = false
    
    var body: some View {
        if isOnboarding {
            OnboardingView(isOnboarding: $isOnboarding)
        } else {
            PlanetView()
        }
    }
}

#Preview {
    ContentView()
}
