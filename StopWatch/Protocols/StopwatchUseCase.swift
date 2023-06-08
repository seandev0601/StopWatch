//
//  StopwatchUseCase.swift
//  StopWatch
//
//  Created by ChaoBo-Shang on 2023/6/7.
//

import Foundation

protocol StopwatchUseCase {
    func start()
    func pause()
    func reset()
    func toggleMode()
    var elapsedSeconds: Int { get }
    var mode: StopwatchMode { get }
}
