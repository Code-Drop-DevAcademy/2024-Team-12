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
    @Binding var showTimer: Bool
    @Binding var taskTitleText: String
    @Binding var selectedTask: Task
    
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
        .onAppear {
            taskTitleText = ""
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
                    .foregroundStyle(.white)
                    .font(.subheadline)
            }
            .padding(.top, 16)
            .padding(.bottom, 16)
            
            Spacer()
        }
        .background {
            RoundedRectangle(cornerRadius: 9)
                .foregroundStyle(.black)
        }
    }
    
    var TaskTitleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("테스크 제목")
                .font(.headline)
            TextField("Task 제목을 입력하세요", text: $taskTitleText)
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
                ForEach(Task.allCases, id: \.self) { task in
                    Button {
                        selectedTask = task
                    } label: {
                        HStack {
                            Spacer()
                            Text(task.rawValue)
                                .bold()
                                .foregroundStyle(selectedTask == task ? .white : .black.opacity(0.5))
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(selectedTask == task ? Color.black : Color.white)
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
            showTimer = true
            self.presentationMode.wrappedValue.dismiss()
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
