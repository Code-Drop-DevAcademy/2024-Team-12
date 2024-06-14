//
//  TaskRegisterView.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

import SwiftUI
import SwiftData

struct TaskRegisterView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Query var items: [Item]
    @Binding var selectedIndex: Int
    @State var taskTitleText: String = ""
    @State var taskCase: Int = 0
    
    let buttonNames: [String] = ["Work", "Life"]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 24) {
                    SelectedStar
                    TaskTitleSection
                    TaskCaseSection
                }
                .padding(16)
            }
            .navigationTitle("테스크 작성")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    CancelButton
                }
                ToolbarItem(placement: .topBarTrailing) {
                    RegisterButton
                }
            }
        }
        .dismissKeyboard()
    }
}

extension TaskRegisterView {
    var SelectedStar: some View {
        HStack {
            Spacer()
            
            VStack(spacing: 4) {
                Image(StringLiterals.StarImage.allCases[selectedIndex].rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                Text(items.first?.starName[selectedIndex] ?? "Error")
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
            
            Spacer()
        }
        .background {
            RoundedRectangle(cornerRadius: 9)
                .foregroundStyle(.gray)
        }
    }
    
    var TaskTitleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("테스크 제목")
                .font(.headline)
            TextField("테스크 제목을 입력하세요", text: $taskTitleText)
                .padding(.vertical, 12)
                .padding(.horizontal, 8)
                .clipShape(RoundedRectangle(cornerRadius: 9))
                .overlay{
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.black.opacity(0.5))
                }
        }
    }
    
    var TaskCaseSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("테스크 종류")
                .font(.headline)
            
            HStack(spacing: 10) {
                ForEach(0..<2) { i in
                    Button {
                        taskCase = i
                    } label: {
                        HStack {
                            Spacer()
                            Text(buttonNames[i])
                                .bold()
                                .foregroundStyle(i == taskCase ? .white : .black.opacity(0.5))
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(i == taskCase ? Color.black : Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        .overlay {
                            RoundedRectangle(cornerRadius: 7).stroke(.black.opacity(0.5), lineWidth: 1.0)
                        }
                    }
                }
            }
        }
    }
    
    var CancelButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Text("취소")
        }
    }
    
    var RegisterButton: some View {
        Button {
            print("regist")
        } label: {
            Text("등록")
                .fontWeight(.semibold)
        }
        .disabled(taskTitleText.isEmpty)
    }
}

//#Preview {
//    TaskRegisterView()
//}
