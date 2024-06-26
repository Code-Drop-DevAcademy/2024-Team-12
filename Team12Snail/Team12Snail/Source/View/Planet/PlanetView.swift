//
//  PlanetView.swift
//  Team12Snail
//
//  Created by 이윤학 on 6/15/24.
//

import SwiftUI
import SwiftData

enum Task: String, CaseIterable {
    case work = "Work"
    case life = "Life"
}

struct PlanetView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var items: [Item]
    
    @State private var selectedIndex: Int = 0
    @State private var showRegisterSheet: Bool = false
    @State private var showTimer: Bool = false
    @State private var isTimerRunning: Bool = false
    @State private var taskTitleText: String = ""
    @State private var selectedTask: Task = .work
    @State var moveNextView: Bool = false
    @State var isButtonDisabled: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                PlanetImageView(characterSize: 270, characterPosition: -110)
                if showTimer {
                    StopWatchView(selectedIndex: $selectedIndex,
                                  selectedTask: $selectedTask,
                                  taskTitleText: $taskTitleText,
                                  isTimerRunning: $isTimerRunning,
                                  showTimer: $showTimer)
                    .padding(.bottom, 30)
                } else {
                    StarSelectingView(selectedIndex: $selectedIndex, showRegisterSheet: $showRegisterSheet, isButtonDisabled: $isButtonDisabled)
                        .padding(.bottom, 10)
                        .overlay {
                            ChangeStarButton
                        }
                }
            }
            .overlay(alignment: .topTrailing) {
                VStack(spacing: 4) {
                    ShoppingButton
                        .padding(.trailing, 16)
                        .padding(.top, 16)
                    CurrentStar
                        .padding(.trailing, 16)
                }
            }
            .sheet(isPresented: $showRegisterSheet) {
                TaskRegisterView(selectedIndex: $selectedIndex,
                                 showTimer: $showTimer,
                                 taskTitleText: $taskTitleText,
                                 selectedTask: $selectedTask)
            }
            .navigationDestination(isPresented: $moveNextView) {
                StoreView(items: items.first ?? Item(starName: [:], starPoint: [:], selectedItems: [:], purchasedItems: [:]))
            }
        }
    }
}

extension PlanetView {
    var PlanetImage: some View {
        Image(.imageDummyPlanet)
            .resizable()
            .scaledToFill()
            .clipped()
    }
    
    var ChangeStarButton: some View {
        HStack {
            Button {
                isButtonDisabled = true
                if selectedIndex > 0 {
                    selectedIndex -= 1
                }
                // 0.5초 후에 버튼을 다시 활성화
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    isButtonDisabled = false
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.largeTitle)
                    .shadow(radius: 4, y: 4)
                    .padding()
                    .foregroundStyle(.white)
            }
            .disabled(isButtonDisabled)
            
            Spacer()
            Button {
                isButtonDisabled = true
                if selectedIndex < 3 {
                    selectedIndex += 1
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    isButtonDisabled = false
                }
            } label: {
                Image(systemName: "chevron.right")
                    .font(.largeTitle)
                    .shadow(radius: 4, y: 4)
                    .padding()
                    .foregroundStyle(.white)
            }
            .disabled(isButtonDisabled)
        }
        .padding(8)
    }
    
    var ShoppingButton: some View {
        Button {
            moveNextView = true
            print("move To shop")
        } label: {
            Image(systemName: "storefront.circle.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundStyle(.black)
                .padding(8)
        }
    }
    
    var CurrentStar: some View {
        HStack {
            VStack(spacing: 8) {
                ForEach(0..<4, id: \.self) { index in
                    Image(StringLiterals.StarImage.allCases[index].rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            }
            VStack(spacing: 9) {
                ForEach(0..<4, id: \.self) { index in
                    Text("\(items.first?.starPoint[index] ?? 0)")
                        .font(.callout)
                        .bold()
                }
            }
        }
    }
}


#Preview {
    PlanetView()
    
}
