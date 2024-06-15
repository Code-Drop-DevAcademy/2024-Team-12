
import SwiftUI
import SwiftData

struct OnboardingView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var items: [Item]
    @State private var greenStarText = ""
    @State private var orangeStarText = ""
    @State private var yellowStarText = ""
    @State private var pinkStarText = ""
    @Binding var isOnboarding: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle().frame(height: 40).foregroundStyle(.white)
            ScrollView {
                VStack {
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
                            isOnboarding = false
                            
                        }) {
                            Text("완료")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                        }
                        .disabled(greenStarText.isEmpty || orangeStarText.isEmpty || yellowStarText.isEmpty || pinkStarText.isEmpty)
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .fill(greenStarText.isEmpty || orangeStarText.isEmpty || yellowStarText.isEmpty || pinkStarText.isEmpty ? Color.gray : Color.black)
                        )
                        .frame(width: 150, height: 50)
                        .padding(.top, 20)
                    }
                }
            }
        }
    }
    
    func initItems() {
        let item = Item(
            starName: [0: greenStarText, 1: orangeStarText, 2: yellowStarText, 3: pinkStarText],
            starPoint: [0:0, 1:0, 2:0, 3:0],
            selectedItems: [0:"Default", 1:"", 2:"DefaultPlanet", 3:"DefaultBackground"],
            purchasedItems: [0:["Default"], 1:[], 2:["DefaultPlanet"], 3:["DefaultBackground"]]
        )
        
        modelContext.insert(item)
        
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

//#Preview {
//    OnboardingView()
//}
