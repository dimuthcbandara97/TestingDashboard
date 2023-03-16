//
//  TimerView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import UIKit

final class TimerView: BaseInfoView {

    private let elapsedTimeLable: UILabel = {
        let label = UILabel()
        label.text = "Time Remaining"
//        lable.font =
        label.textColor = .orange
        label.textAlignment = .center
        return label
    }()

    private let elapsedTimeValueLable: UILabel = {
        let label = UILabel()
        label.text = "02:15"
//        lable.font =
        label.textColor = .green
        label.textAlignment = .center
        return label
    }()

    private let remainingTimeLable: UILabel = {
        let lable = UILabel()
        lable.text = "Remaining Time"
//        lable.font =
        lable.textColor = .black
        lable.textAlignment = .center
        return lable
    }()

    private let remainingTimeValueLable: UILabel = {
        let lable = UILabel()
        lable.text = "12:45"
//        lable.font =
        lable.textColor = .gray
        lable.textAlignment = .center
        return lable
    }()

    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = 25
        return view
    }()

    
    private let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    

    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0

    var callBack: (() -> Void)?

    func configure(with duration: Double, progress: Double) {
        timerDuration = duration

        let tempCurrentValue = progress > duration ? duration : progress

        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        let roundedPercent = Int(round(percent * 100))

        elapsedTimeValueLable.text = getDisplayedString(from: Int(tempCurrentValue))
        remainingTimeValueLable.text = getDisplayedString(from: Int(duration - tempCurrentValue))

    }

    func startTimer() {

    }

    func pauseTimer() {

    }

    func stopTimer() {
       
    }
}

extension TimerView {
    override func setupViews() {
        super.setupViews()

        setupView(timeStackView)
        setupView(bottomStackView)

        [
            elapsedTimeLable,
            elapsedTimeValueLable,
            remainingTimeLable,
            remainingTimeValueLable
        ].forEach(timeStackView.addArrangedSubview)
        
        [
            bottomSeparatorView,

        ].forEach(bottomStackView.addArrangedSubview)
        
        
    }

    override func constaintViews() {
        super.constaintViews()

        NSLayoutConstraint.activate([

            
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


