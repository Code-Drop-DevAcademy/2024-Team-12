//
//  Item.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

//import Foundation
//import SwiftData
//
//@Model
//final class Item : ObservableObject {
//    var starName: [Int : String]
//    var starPoint: [Int : Int]
//    var selectedItems: [Int : String]
//    var purchasedItems: [Int : [String]]
//    
//    init(starName: [Int : String], starPoint: [Int : Int], selectedItems: [Int : String], purchasedItems: [Int : [String]]) {
//        self.starName = starName
//        self.starPoint = starPoint
//        self.selectedItems = selectedItems
//        self.purchasedItems = purchasedItems
//    }
//}

//
//import Foundation
//import SwiftData
//final class Item: ObservableObject {
//    @Published var starName: [Int: String]
//    @Published var starPoint: [Int: Int]
//    @Published var selectedItems: [Int: String]
//    @Published var purchasedItems: [Int: [String]]
//    
//    init(starName: [Int: String] = [:], starPoint: [Int: Int] = [:], selectedItems: [Int: String] = [:], purchasedItems: [Int: [String]] = [:]) {
//        self.starName = starName
//        self.starPoint = starPoint
//        self.selectedItems = selectedItems
//        self.purchasedItems = purchasedItems
//    }
//}


import Foundation
import SwiftData

@Model
final class Item {
    var starName: [Int : String]
    var starPoint: [Int : Int]
    var selectedItems: [Int : String]
    var purchasedItems: [Int : [String]]
    
    init(starName: [Int : String], starPoint: [Int : Int], selectedItems: [Int : String], purchasedItems: [Int : [String]]) {
        self.starName = starName
        self.starPoint = starPoint
        self.selectedItems = selectedItems
        self.purchasedItems = purchasedItems
    }
}
