//
//  OnboardingView.swift
//  Team12Snail
//
//  Created by 임유리 on 6/15/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var greenStarText = ""
    @State private var orangeStarText = ""
    @State private var yellowStarText = ""
    @State private var pinkStarText = ""
    
    var body: some View {
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
        }
    }
}

#Preview {
    OnboardingView()
}
