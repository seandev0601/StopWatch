//
//  StopwatchPresenter.swift
//  StopWatch
//
//  Created by ChaoBo-Shang on 2023/6/7.
//

import Foundation
import Combine

class StopwatchPresenter: ObservableObject {
    @Published private var stopwatchUseCase: StopwatchUseCase
    private var timer: Timer?
    
    init(stopwatchUseCase: StopwatchUseCase) {
        self.stopwatchUseCase = stopwatchUseCase
    }
    
    func didTapStart() {
        stopwatchUseCase.start()
        startTimer()
    }
    
    func didTapPause() {
        stopwatchUseCase.pause()
        stopTimer()
        self.objectWillChange.send()
    }
    
    func didTapReset() {
        stopwatchUseCase.reset()
        stopTimer()
        self.objectWillChange.send()
    }
    
    func didTapToggle() {
        stopwatchUseCase.toggleMode()
        self.objectWillChange.send()
    }
    
    var toggleTitle: String {
        return stopwatchUseCase.mode.rawValue
    }
    
    var elapsedTimeText: String {
        // 實作返回經過的時間文字表示
        let minutes = (stopwatchUseCase.elapsedSeconds % 3600) / 60
        let seconds = (stopwatchUseCase.elapsedSeconds % 3600) % 60
        
        switch stopwatchUseCase.mode {
        case .standard:
            return String(format: "%02d:%02d", minutes, seconds)
        case .compact:
            return String(format: "%02d", minutes)
        }
    }
    
    var finishTimeText: String {
        if timer != nil || stopwatchUseCase.elapsedSeconds == 0 { return "" }
        
        let minutes = (stopwatchUseCase.elapsedSeconds % 3600) / 60
        let seconds = (stopwatchUseCase.elapsedSeconds % 3600) % 60

        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
