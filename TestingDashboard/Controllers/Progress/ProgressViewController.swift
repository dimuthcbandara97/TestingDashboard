//
//  ProgressViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit

class ProgressBaseController: BaseController {

    private let dailyPerformanceView = DailyPerformanceView(with: "Daily Perfomance",
                                                            buttonTitle: "Some Days")
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Progress"
    }
}

extension ProgressBaseController {
    
    // Setup Views
    override func setupViews() {
        super.setupViews()
        
        view.setupView(dailyPerformanceView)
    }
    
    // Configure Appearance
    override func configureAppearance() {
        super.configureAppearance()
    }
    
    // constaintViews
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),

        ])
        
        dailyPerformanceView.configure(with: [.init(value: "D1", heigntMultiplier: 1.0, title: "MON"),
                                              .init(value: "D2", heigntMultiplier: 0.4, title: "TUE"),
                                              .init(value: "D3", heigntMultiplier: 0.6, title: "WED"),
                                              .init(value: "D4", heigntMultiplier: 0.8, title: "THU"),
                                              .init(value: "D5", heigntMultiplier: 1, title: "FRI"),
                                              .init(value: "D6", heigntMultiplier: 0.6, title: "SAT"),
                                              .init(value: "D7", heigntMultiplier: 0.4, title: "SUN")])

    }
}
