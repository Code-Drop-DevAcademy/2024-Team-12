//
//  View+.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

import SwiftUI

extension View {
    func dismissKeyboard() -> some View {
        self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
