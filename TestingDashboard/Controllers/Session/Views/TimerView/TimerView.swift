//
//  TimerView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import UIKit
import MusicKit
import MediaPlayer


enum TimerState {
    case isRuning
    case isPaused
    case isStopped
}

final class TimerView: BaseInfoView {
    
    let musicPlayer = MPMusicPlayerController.systemMusicPlayer
    
    // MARK: Elapsed Time
    private let elapsedTimeLable: UILabel = {
        let label = UILabel()
        label.text = "Completed Time"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // Elapsed Time Value
    private let elapsedTimeValueLable: UILabel = {
        let label = UILabel()
        label.text = "02:15"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 36, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    // Remaining Time
    private let remainingTimeLable: UILabel = {
        let label = UILabel()
        label.text = "Remaining Time"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // Remaining Time Value
    private let remainingTimeValueLable: UILabel = {
        let label = UILabel()
        label.text = "12:45"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 36, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // Time Stack View
    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    // Bottom Stack View
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = 25
        return view
    }()
    
    
    private let completedPercentView = PercentView()
    private let remainingPercentView = PercentView()
    
    // Bottom Seperator
    private let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let progressView = ProgressView()
    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    var state: TimerState = .isStopped
    var callBack: (() -> Void)?
    
    // MARK: Configure
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        
        let tempCurrentValue = progress > duration ? duration : progress
        
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        let roundedPercent = Int(round(percent * 100))
        
        elapsedTimeValueLable.text = getDisplayedString(from: Int(tempCurrentValue))
        remainingTimeValueLable.text = getDisplayedString(from: Int(duration - tempCurrentValue))
        completedPercentView.configure(with: "COMP", andValue: roundedPercent)
        remainingPercentView.configure(with: "REM", andValue: 100 - roundedPercent)
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    // MARK: Start Timer
    func startTimer() {
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                self.callBack?()
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    // MARK: PAUSE Timer
    func pauseTimer() {
        timer.invalidate()
    }
    
    // MARK: Stop Timer
    func stopTimer() {
        guard self.timerProgress > 0 else { return }
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= 0.1
            self.timerProgress -= self.timerDuration * 0.02
            
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    // MARK: Play Music
    func playMusic() {
        // Set the queue of songs to play
        //        let songsQuery = MPMediaQuery.songs()
        //        let songs = songsQuery.items ?? []
        //        musicPlayer.setQueue(with: songs)
        
        let songsQuery = MPMediaQuery.songs()
        let songs = songsQuery.items?.map { $0.title ?? "" } ?? []
        musicPlayer.setQueue(with: songs)
        
        // Start playing the music
        musicPlayer.play()
    }
    
    
    func pauseMusic() {
        musicPlayer.pause()
    }
    
}

extension TimerView {
    override func setupViews() {
        super.setupViews()
        
        setupView(progressView)
        setupView(timeStackView)
        setupView(bottomStackView)
        
        [
            elapsedTimeLable,
            elapsedTimeValueLable,
            remainingTimeLable,
            remainingTimeValueLable
        ].forEach(timeStackView.addArrangedSubview)
        
        [
            completedPercentView,
            bottomSeparatorView,
            remainingPercentView,
        ].forEach(bottomStackView.addArrangedSubview)
        
        
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 175),
            
            bottomSeparatorView.widthAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}

private extension TimerView {
    func getDisplayedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0
        ? [minutesStr, secondStr].joined(separator: ":")
        : [hoursStr, minutesStr, secondStr].joined(separator: ": ")
    }
}

