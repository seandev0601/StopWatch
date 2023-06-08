//
//  StopWatchApp.swift
//  StopWatch
//
//  Created by ChaoBo-Shang on 2023/6/7.
//

import SwiftUI

// 建立初始碼錶實例
let initialStopwatch = Stopwatch(isRunning: false, elapsedSeconds: 0)

// 建立必要的相依性
let stopwatchInteractor = StopwatchInteractor(stopwatch: initialStopwatch)
let stopwatchPresenter = StopwatchPresenter(stopwatchUseCase: stopwatchInteractor)


@main
struct StopWatchApp: App {
    var body: some Scene {
        WindowGroup {
            StopwatchView(presenter: stopwatchPresenter)
        }
    }
}
