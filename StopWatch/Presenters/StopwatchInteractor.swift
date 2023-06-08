//
//  StopwatchInteractor.swift
//  StopWatch
//
//  Created by ChaoBo-Shang on 2023/6/7.
//

import Foundation
import AVFoundation

class StopwatchInteractor: StopwatchUseCase {
    
    @Published private var stopwatch: Stopwatch
    private var timer: Timer?
    private var audioPlayer: AVAudioPlayer?
    
    var elapsedSeconds: Int {
        return stopwatch.elapsedSeconds
    }
    
    var mode: StopwatchMode {
        return stopwatch.mode
    }
    
    init(stopwatch: Stopwatch) {
        self.stopwatch = stopwatch
    }
    
    func start() {
        if stopwatch.isRunning { return }
        print("start")
        stopwatch.isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.tick()
        }
    }
    
    func pause() {
        print("pause")
        stopwatch.isRunning = false
        timer?.invalidate()
    }
    
    func reset() {
        print("reset")
        stopwatch.isRunning = false
        stopwatch.elapsedSeconds = 0
        timer?.invalidate()
    }
    
    func toggleMode() {
        stopwatch.mode = (stopwatch.mode == .standard) ? .compact : .standard
    }
    
    private func tick() {
        stopwatch.elapsedSeconds += 1
        playTickSoundIfNeeded()
        playDingSoundIfNeeded()
        print("\(stopwatch.elapsedSeconds)")
    }
    
    private func playTickSoundIfNeeded() {
        if stopwatch.elapsedSeconds % 60 == 0 {
            return
        }
        
        if stopwatch.mode == .compact { return }
        
        let tickSoundURL = Bundle.main.url(forResource: "second", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: tickSoundURL!)
            audioPlayer?.play()
        } catch {
            print("無法播放滴聲音效")
        }
    }
    
    private func playDingSoundIfNeeded() {
        if stopwatch.elapsedSeconds % 60 != 0 {
            return
        }
        
        let dingSoundURL = Bundle.main.url(forResource: "min", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: dingSoundURL!)
            audioPlayer?.play()
        } catch {
            print("無法播放答聲音效")
        }
    }
}
