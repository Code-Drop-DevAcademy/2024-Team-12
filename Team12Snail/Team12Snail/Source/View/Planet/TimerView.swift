//
//  TimerView.swift
//  Team12Snail
//
//  Created by 임유리 on 6/15/24.
//

import SwiftUI

class StopWatchManager: ObservableObject {
    @Published var counter: Double = 0.0
    @Published var starcount: Double = 0.0
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
        //print( self.counter / 10.0) //10초에 1개로 계산되도록 처리
        //starcount = self.counter / 10.0
        print("**")
        print(starcount)
        print("**")
        //MARK: - 업무적 / 일상적 분류해서 별사탕 개수 처리
    }
    
    func reset() {
        // 타이머 중지 및 초기화
        self.timer.invalidate()
        self.counter = 0.0
    }
    
}

struct StopWatchView: View {
    @StateObject var stopWatchManager = StopWatchManager()
    @State private var buttoncontrol: Bool = false

    var body: some View {
        //Spacer()
        ZStack{
            VStack{
                Image("star")
                
                VStack{
                    Text("work")
                        .frame(width: 50, height: 15)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(50)
                    
                    Text("SNS 광고 레퍼런스 탐색하기")
                        .font(.title3)
                        .bold()
                    
                    VStack {
                        // 타이머 값 표시 레이블
                        Text(String(format: "%.2f", stopWatchManager.counter))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                        
                        HStack {
                            // 타이머 시작 버튼
                            if buttoncontrol == false {
                                Button(action: {
                                    self.stopWatchManager.start()
                                    buttoncontrol = true
                                    print(buttoncontrol)
                                }) {
                                    //Text("􀊖")
                                    Image(systemName: "play.circle")
                                        .foregroundColor(.black)
                                        .font(.largeTitle)
                                }
                            }
                            
                            // 타이머 중지 버튼
                            if buttoncontrol == true {
                                Button(action: {
                                    buttoncontrol = false
                                    self.stopWatchManager.stop()
                                    print(buttoncontrol)
                                    
                                }) {
                                    //Text("􀜪")
                                    Image(systemName: "pause.fill")
                                        .foregroundColor(.black)
                                        .font(.largeTitle)
                                }
                            }
                            
                            Button(action: {
                                //self.stopWatchManager.reset()
                                //print(starcount)
                                print("별사탕 개수")
                                //starcount = self.counter / 10.0
                                print(Int(stopWatchManager.counter / 10.0))
                                print("별사탕 개수")
                            }) {
                                //Text("􁣛")
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.black)
                                    .font(.largeTitle)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView()
    }
}
