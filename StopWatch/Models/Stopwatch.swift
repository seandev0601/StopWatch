//
//  Stopwatch.swift
//  StopWatch
//
//  Created by ChaoBo-Shang on 2023/6/7.
//

import Foundation

struct Stopwatch {
    var isRunning: Bool
    var elapsedSeconds: Int
    var mode: StopwatchMode = .standard
    var onVoice: Bool = true
}
