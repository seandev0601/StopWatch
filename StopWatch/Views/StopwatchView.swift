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
        VStack {
            Text("\(presenter.elapsedTimeText)")
                .font(.system(size: 150, weight: .bold))
                .padding()
                
            
            HStack {
                Button(action: presenter.didTapStart) {
                    Text("開始")
                        .font(.largeTitle)
                }
                .padding()
                
                Button(action: presenter.didTapPause) {
                    Text("暫停")
                        .font(.largeTitle)
                }
                .padding()
                
                Button(action: presenter.didTapReset) {
                    Text("重置")
                        .font(.largeTitle)
                }
                .padding()
            }
            
            Button(action: presenter.didTapToggle) {
                Text("\(presenter.toggleTitle)")
                    .font(.largeTitle)
            }
            .padding()
            
            Text("\(presenter.finishTimeText)")
                .font(.system(size: 50, weight: .medium))
                .padding()
        }
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        let initialStopwatch = Stopwatch(isRunning: false, elapsedSeconds: 0)
        let stopwatchInteractor = StopwatchInteractor(stopwatch: initialStopwatch)
        let stopwatchPresenter = StopwatchPresenter(stopwatchUseCase: stopwatchInteractor)
        
        return StopwatchView(presenter: stopwatchPresenter)
    }
}
