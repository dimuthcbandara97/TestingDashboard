//
//  SessionViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit

final class SessionBaseController: BaseController {
    
    private let timerView = TimerView()
    private let statsView = StatsView(with: "STANDARD RATES")
    private let progress2View = Progress2View(with: "PROGRESS 2")
    
    private var timerDuration = 300
    
    
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRuning ? .isStopped : .isRuning
        addNavBarButton(
            at: .Left,
            with: timerView.state == .isRuning
            ? "PAUSE" : "START"
        )
    }
    
    override func navBarRightButtonHanler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        
        addNavBarButton(at: .Left, with: "START")
    }
}

extension SessionBaseController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
        view.setupView(statsView)
        view.setupView(progress2View)
        view.backgroundColor = .white
        
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            progress2View.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            progress2View.topAnchor.constraint(equalTo: statsView.topAnchor),
            progress2View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            progress2View.heightAnchor.constraint(equalTo: statsView.heightAnchor),
        ])
    }
    
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = OverallController.Strings.NavBar.session
        navigationController?.tabBarItem.title = OverallController.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .Left, with: "START")
        addNavBarButton(at: .Right, with: "FINISH")
        
        timerView.configure(with: Double(timerDuration), progress: 0)
        
        timerView.callBack = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.navBarRightButtonHanler()
            }
        }
 
//        APICaller.shared.loadStats { results in
//                DispatchQueue.main.async {
//
//                }
//            }
        progress2View.configure(with: [.init(value: "1k", heightMultiplier: 1, title: "2/14"),
                                       .init(value: "1k", heightMultiplier: 0.1, title: "2/15"),
                                       .init(value: "1k", heightMultiplier: 0.1, title: "2/16"),
                                       .init(value: "1k", heightMultiplier: 0.1, title: "2/17"),])
        

        APICaller.shared.loadStats { results in
            DispatchQueue.main.async {
                // Update statsView with retrieved data
                // For example:
                self.statsView.configure(with: [.topic01(value: results[0].bloodpressure),
                                           .topic02(value: results[0].heartrate),
                                           .topic03(value: results[0].bmi),
                                           .topic04(value: results[0].bodyfat)])
            }
        }

        
        
    }
}

