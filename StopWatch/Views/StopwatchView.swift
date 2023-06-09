//
//  StopwatchView.swift
//  StopWatch
//
//  Created by ChaoBo-Shang on 2023/6/7.
//

import SwiftUI

struct StopwatchView: View {
    @ObservedObject var presenter: StopwatchPresenter
    
    var body: some View {
        VStack() {
            Text("\(presenter.elapsedTimeText)")
                .font(.system(size: Device.deviceType == .ipad ? 250 : 200, weight: .bold))
                .foregroundColor(presenter.timeColor)
                .padding(.bottom, -30)
                
            
            HStack {
                Button(action: presenter.didTapStart) {
                    Text("開始")
                        .font(.title2)
                }
                .padding()
                
                Button(action: presenter.didTapPause) {
                    Text("暫停")
                        .font(.title2)
                }
                .padding()
                
                Button(action: presenter.didTapReset) {
                    Text("重置")
                        .font(.title2)
                }
                .padding()
            }
            
            HStack {
                Button(action: presenter.didTapToggle) {
                    Text("\(presenter.toggleTitle)")
                        .font(.title2)
                }
                .padding()
                    
                Button(action: presenter.didTapVoiceToggle) {
                    Text("\(presenter.voiceStateString)")
                        .font(.title2)
                }
                .padding()
            }
            
            Text("\(presenter.finishTimeText)")
                .font(.title)
                .padding()
        }
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        let initialStopwatch = Stopwatch(isRunning: false, elapsedSeconds: 0)
        let stopwatchInteractor = StopwatchInteractor(stopwatch: initialStopwatch)
        let stopwatchPresenter = StopwatchPresenter(stopwatchUseCase: stopwatchInteractor)
        
        return Group {
            StopwatchView(presenter: stopwatchPresenter)
                .previewInterfaceOrientation(.portrait)
        }
            
            
    }
}
