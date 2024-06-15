////
////  OnboardingView.swift
////  Team12Snail
////
////  Created by 임유리 on 6/15/24.
////
//
//import SwiftUI
//
//struct OnboardingView: View {
//    
////    @State private var greenStarText = ""
////    @State private var orangeStarText = ""
////    @State private var yellowStarText = ""
////    @State private var pinkStarText = ""
////
//    @StateObject private var item = Item(
//        starName: [0: "", 1: "", 2: "", 3: ""],
//        starPoint: [:],
//        selectedItems: [:],
//        purchasedItems: [:]
//    )
//    
//    @StateObject private var item = Item(
////        starName: [:], starPoint: [:], selectedItems: [:], purchasedItems: [:]
//        starName: [0: "", 1: "", 2: "", 3: ""],
//        starPoint: [:],
//        selectedItems: [:],
//        purchasedItems: [:]
//    )
//    
//    var body: some View {
//        VStack(alignment: .leading){
//            Text("나의 자기계발 영역")
//                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                .bold()
//            Text("성장하고 싶은 분야를 작성해보세요")
//                .font(.title3)
//        }.frame(maxWidth: .infinity, alignment: .leading)
//            .padding()
//        
//        Spacer().frame(height: 70)
//        VStack{
//            HStack{
//                VStack{
//                    Image("GreenStar")
//                    TextField("자기계발1", text: $item.starName[0]!)
//                        .frame(width:120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                        .onChange(of: $item.starName[0]!) { newValue in
//                            //if newValue.count > 8 {
//                                $item.starName[0]! = String(newValue.prefix(8))
//                            //}
//                           // item.starName[0] = greenStarText
//                        }
//                    
//                    
//                }
//                Spacer().frame(width: 50)
//                VStack{
//                    Image("OrangeStar")
//                    TextField("자기계발2", text: $item.starName[1]!)
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                        .onChange(of: item.starName[1]!) { newValue in
//                            item.starName[1] =  String(newValue.prefix(8))
//                        }
//                }
//            }
//            Spacer().frame(height: 50)
//            
//            HStack{
//                VStack{
//                    Image("YellowStar")
//                    TextField("자기계발3", text: $item.starName[2]!)
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                        .onChange(of: $item.starName[2]!) { newValue in
//                            $item.starName[2]! = String(newValue.prefix(8))
//                        }
//                    
//                }
//                Spacer().frame(width: 50)
//                
//                VStack{
//                    Image("PinkStar")
//                    TextField("자기계발4", text: $item.starName[3]!)
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                        .onChange(of: $item.starName[3]!) { newValue in
//                            $item.starName[3]! = String(newValue.prefix(8))
//                        }
//                }
//            }
//            Spacer().frame(height: 50)
//            Button(action: {
//                print("완료 버튼")
//            }) {
//                Text("완료")
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//            }
////            .disabled(greenStarText.isEmpty || orangeStarText.isEmpty || yellowStarText.isEmpty || pinkStarText.isEmpty)
//            //            .background(RoundedRectangle(cornerRadius: 50).fill(Color.gray))
//            .disabled(item.starName.values.contains(where: { $0.isEmpty }))
//
//            .background(
//                RoundedRectangle(cornerRadius: 50)
////                    .fill(greenStarText.isEmpty || orangeStarText.isEmpty || yellowStarText.isEmpty || pinkStarText.isEmpty ? Color.gray : Color.black)
//                    .fill(item.starName.values.contains(where: { $0.isEmpty }) ? Color.gray : Color.black)
//
//            )
//            .frame(width: 150, height: 50)
//            .padding(.top, 20)
//            //Button
//        }
//    }
//}
//
//#Preview {
//    OnboardingView()
//}


//import SwiftUI
//
//
//
//struct OnboardingView: View {
//    
//    @StateObject private var item = Item(
//        starName: [0: "", 1: "", 2: "", 3: ""],
//        starPoint: [:],
//        selectedItems: [:],
//        purchasedItems: [:]
//    )
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("나의 자기계발 영역")
//                .font(.title)
//                .bold()
//            Text("성장하고 싶은 분야를 작성해보세요")
//                .font(.title3)
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .padding()
//        
//        Spacer().frame(height: 70)
//        
//        VStack {
//            HStack {
//                VStack {
//                    Image("GreenStar")
//                    TextField("자기계발1", text: $item.starName[0]!)
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                        .onChange(of: item.starName[0]) { newValue in
//                                item.starName[0] = String(newValue.prefix(8))
//                        }
//                }
//                
//                Spacer().frame(width: 50)
//                
//                VStack {
//                    Image("OrangeStar")
//                    TextField("자기계발2", text: $item.starName[1]!)
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                        .onChange(of: item.starName[1]) { newValue in
//                            if newValue.count > 8 {
//                                item.starName[1] = String(newValue.prefix(8))
//                            }
//                        }
//                }
//            }
//            
//            Spacer().frame(height: 50)
//            
//            HStack {
//                VStack {
//                    Image("YellowStar")
//                    TextField("자기계발3", text: $item.starName[2]!)
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                        .onChange(of: item.starName[2]) { newValue in
//                            if newValue.count > 8 {
//                                item.starName[2] = String(newValue.prefix(8))
//                            }
//                        }
//                }
//                
//                Spacer().frame(width: 50)
//                
//                VStack {
//                    Image("PinkStar")
//                    TextField("자기계발4", text: $item.starName[3]!)
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                        .onChange(of: item.starName[3]) { newValue in
//                            if newValue.count > 8 {
//                                item.starName[3] = String(newValue.prefix(8))
//                            }
//                        }
//                }
//            }
//            
//            Spacer().frame(height: 50)
//            
//            Button(action: {
//                print("완료 버튼")
//                // 이곳에서 item 객체를 사용하여 필요한 작업을 수행할 수 있음
//            }) {
//                Text("완료")
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//            }
//            .disabled(item.starName.values.contains(where: { $0.isEmpty }))
//            .background(
//                RoundedRectangle(cornerRadius: 50)
//                    .fill(item.starName.values.contains(where: { $0.isEmpty }) ? Color.gray : Color.black)
//            )
//            .frame(width: 150, height: 50)
//            .padding(.top, 20)
//        }
//    }
//}
//
//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}


//
//  OnboardingView.swift
//  Team12Snail
//
//  Created by 임유리 on 6/15/24.
//

//import SwiftUI
//
//struct OnboardingView: View {
//    
//    @State private var greenStarText = ""
//    @State private var orangeStarText = ""
//    @State private var yellowStarText = ""
//    @State private var pinkStarText = ""
//    
//    var body: some View {
//        VStack(alignment: .leading){
//            Text("나의 자기계발 영역")
//                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                .bold()
//            Text("성장하고 싶은 분야를 작성해보세요")
//                .font(.title3)
//        }.frame(maxWidth: .infinity, alignment: .leading)
//          .padding()
//        Spacer().frame(height: 70)
//        VStack{
//            HStack{
//                VStack{
//                    Image("GreenStar")
//                    TextField("자기계발1", text: $greenStarText)
//                        .frame(width:120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                    
//                }
//                Spacer().frame(width: 50)
//                VStack{
//                    Image("OrangeStar")
//                    TextField("자기계발2", text: $orangeStarText)
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                }
//                
//            }
//            Spacer().frame(height: 50)
//
//            HStack{
//                VStack{
//                    Image("YellowStar")
//                    TextField("자기계발3", text: $yellowStarText)
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                }
//                Spacer().frame(width: 50)
//
//                VStack{
//                    Image("PinkStar")
//                    TextField("자기계발4", text: $pinkStarText)
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                }
//            }
//            Spacer().frame(height: 50)
//            Button(action: {
//                print("완료 버튼")
//            }) {
//                Text("완료")
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//            }
//            .disabled(greenStarText.isEmpty || orangeStarText.isEmpty || yellowStarText.isEmpty || pinkStarText.isEmpty)
////            .background(RoundedRectangle(cornerRadius: 50).fill(Color.gray))
//            .background(
//                RoundedRectangle(cornerRadius: 50)
//                    .fill(greenStarText.isEmpty || orangeStarText.isEmpty || yellowStarText.isEmpty || pinkStarText.isEmpty ? Color.gray : Color.black)
//            )
//            .frame(width: 150, height: 50)
//            .padding(.top, 20)
//            //Button
//        }
//    }
//}
//
//#Preview {
//    OnboardingView()
//}

//import SwiftUI
//
//struct OnboardingView: View {
//    
//    @ObservedObject var item = Item()
//    
//    var body: some View {
//        VStack(alignment: .leading){
//            Text("나의 자기계발 영역")
//                .font(.title)
//                .bold()
//            Text("성장하고 싶은 분야를 작성해보세요")
//                .font(.title3)
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .padding()
//        
//        Spacer().frame(height: 70)
//        
//        VStack {
//            HStack {
//                VStack {
//                    Image("GreenStar")
//                    TextField("자기계발1", text: $item.starName[0] ?? "")
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                }
//                Spacer().frame(width: 50)
//                VStack {
//                    Image("OrangeStar")
//                    TextField("자기계발2", text: $item.starName[1] ?? "")
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                }
//            }
//            Spacer().frame(height: 50)
//            
//            HStack {
//                VStack {
//                    Image("YellowStar")
//                    TextField("자기계발3", text: $item.starName[2] ?? "")
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                }
//                Spacer().frame(width: 50)
//                VStack {
//                    Image("PinkStar")
//                    TextField("자기계발4", text: $item.starName[3] ?? "")
//                        .frame(width: 120, height: 30)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.top, 5)
//                }
//            }
//            
//            Spacer().frame(height: 50)
//            
//            Button(action: {
//                // Here you can save `item` or perform any other action
//                print("완료 버튼")
//            }) {
//                Text("완료")
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//            }
//            .disabled(item.starName[1]?.isEmpty ?? true || item.starName[2]?.isEmpty ?? true || item.starName[3]?.isEmpty ?? true || item.starName[4]?.isEmpty ?? true)
//            .background(
//                RoundedRectangle(cornerRadius: 50)
//                    .fill(item.starName[1]?.isEmpty ?? true || item.starName[2]?.isEmpty ?? true || item.starName[3]?.isEmpty ?? true || item.starName[4]?.isEmpty ?? true ? Color.gray : Color.black)
//            )
//            .frame(width: 150, height: 50)
//            .padding(.top, 20)
//        }
//        .padding()
//    }
//}
//
//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}

//
//  OnboardingView.swift
//  Team12Snail
//
//  Created by 임유리 on 6/15/24.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var items: [Item]
    @State private var greenStarText = ""
    @State private var orangeStarText = ""
    @State private var yellowStarText = ""
    @State private var pinkStarText = ""
    @State private var moveNextView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                Text("나의 자기계발 영역")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                Text("성장하고 싶은 분야를 작성해보세요")
                    .font(.title3)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Spacer().frame(height: 70)
            VStack{
                HStack{
                    VStack{
                        Image("GreenStar")
                        TextField("자기계발1", text: $greenStarText)
                            .frame(width:120, height: 30)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top, 5)
                        
                    }
                    Spacer().frame(width: 50)
                    VStack{
                        Image("OrangeStar")
                        TextField("자기계발2", text: $orangeStarText)
                            .frame(width: 120, height: 30)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top, 5)
                    }
                    
                }
                Spacer().frame(height: 50)
                
                HStack{
                    VStack{
                        Image("YellowStar")
                        TextField("자기계발3", text: $yellowStarText)
                            .frame(width: 120, height: 30)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top, 5)
                    }
                    Spacer().frame(width: 50)
                    
                    VStack{
                        Image("PinkStar")
                        TextField("자기계발4", text: $pinkStarText)
                            .frame(width: 120, height: 30)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top, 5)
                    }
                }
                Spacer().frame(height: 50)
                Button(action: {
                    print("완료 버튼")
                    if items.isEmpty {
                        initItems()
                    }
                    moveNextView = true
                    
                }) {
                    Text("완료")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .disabled(greenStarText.isEmpty || orangeStarText.isEmpty || yellowStarText.isEmpty || pinkStarText.isEmpty)
                //            .background(RoundedRectangle(cornerRadius: 50).fill(Color.gray))
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(greenStarText.isEmpty || orangeStarText.isEmpty || yellowStarText.isEmpty || pinkStarText.isEmpty ? Color.gray : Color.black)
                )
                .frame(width: 150, height: 50)
                .padding(.top, 20)
                //Button
                .navigationDestination(isPresented: $moveNextView) {
                    PlanetView()
                }
            }
        }
    }
    
    func initItems() {
        let item = Item(starName: [0: greenStarText, 1: orangeStarText, 2: yellowStarText, 3: pinkStarText], starPoint: [0:0, 1:0, 2:0, 3:0], selectedItems: [0:"", 1:"", 2:"", 3:""], purchasedItems: [0:[], 1:[], 2:[], 3:[]])
        
        modelContext.insert(item)
        
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    OnboardingView()
}
