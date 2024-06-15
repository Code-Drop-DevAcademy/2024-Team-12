//
//  TimerView.swift
//  Team12Snail
//
//  Created by 임유리 on 6/15/24.
//

import SwiftUI
import SwiftData

class StopWatchManager: ObservableObject {
    @Published var counter: Double = 0.0
    
    var timer = Timer()
    
    func start() {
        // 0.01초 간격으로 실행되는 타이머 시작
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.counter += 0.01
        }
    }
    
    func stop() {
        // 타이머 중지
        self.timer.invalidate()
    }
    
    func reset() {
        self.timer.invalidate()
        self.counter = 0.0
    }
}

struct StopWatchView: View {
    @StateObject var stopWatchManager = StopWatchManager()
    @Binding var selectedIndex: Int
    @Binding var selectedTask: Task
    @Binding var taskTitleText: String
    @Binding var isTimerRunning: Bool
    @Binding var showTimer: Bool
    @State private var showResultAlert: Bool = false
    @State private var starCount: Int = 0
    
    @Query var items: [Item]
    
    var body: some View {
        VStack(spacing: 0) {
            Image(StringLiterals.StarImage.allCases[selectedIndex].rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
            
            Spacer().frame(height: 14)
            
            Text(selectedTask.rawValue)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(8)
                .padding(.horizontal, 8)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 33))
            
            Spacer().frame(height: 8)
            
            Text(taskTitleText)
                .font(.title3)
                .bold()
            
            Spacer().frame(height: 16)
            
            Text(String(format: "%.2f", stopWatchManager.counter))
                .font(.system(size: 48, weight: .bold))
            
            Spacer().frame(height: 24)
            
            HStack(spacing: 18) {
                Button {
                    isTimerRunning.toggle()
                } label: {
                    Circle()
                        .frame(width: 64, height: 64)
                        .foregroundStyle(.black)
                        .overlay {
                            Image(systemName: isTimerRunning ? "pause.fill" : "play.circle")
                                .font(.system(size: 32, weight: .regular))
                                .foregroundColor(.white)
                        }
                }
                .onChange(of: isTimerRunning) { oldValue, newValue in
                    newValue ? stopWatchManager.start() : stopWatchManager.stop()
                }
                
                Button(action: {
                    guard let starPoint = items.first?.starPoint[selectedIndex] else {
                        return
                    }
                    
                    if selectedTask == .work {
                        starCount = Int(stopWatchManager.counter / 10.0) * 2
                        items.first?.starPoint[selectedIndex] = starPoint + Int(stopWatchManager.counter / 10.0) * 2
                    } else {
                        starCount = Int(stopWatchManager.counter / 10.0)
                        items.first?.starPoint[selectedIndex] = starPoint + Int(stopWatchManager.counter / 10.0)
                    }

                    isTimerRunning = false
                    stopWatchManager.reset()
                    showResultAlert = true
                }) {
                    Circle()
                        .frame(width: 64, height: 64)
                        .foregroundStyle(.black)
                        .overlay {
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 32, weight: .regular))
                                .foregroundColor(.white)
                        }
                }
            }
            .alert(isPresented: $showResultAlert) {
                        Alert(title: Text("\(items.first?.starName[selectedIndex] ?? "오류") 별사탕"),
                              message: Text("별사탕 \(starCount)개를 획득했습니다!"),
                              dismissButton: .default(Text("확인"), action: { showTimer = false }))
                    }
        }
    }
}
