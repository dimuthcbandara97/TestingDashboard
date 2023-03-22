//
//  SessionViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit

final class SessionBaseController: BaseController {
    
    private let timerView = TimerView()
    private let statsView = StatsView(with: "STATS")
    private let progress2View = Progress2View(with: "PROGRESS 2")
    
    private let timerDuration = 5.0
    
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
        
        timerView.configure(with: timerDuration, progress: 0)
        
        timerView.callBack = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.navBarRightButtonHanler()
            }
        }
        
        //        timerView.callBack = { [weak self] in
        //            self?.navBarRightButtonHandler()
        //        }
        
        
        progress2View.configure(with: [.init(value: "8k", heigntMultiplier: 1, title: "2/14"),
                                   .init(value: "7k", heigntMultiplier: 0.8, title: "2/15"),
                                   .init(value: "5k", heigntMultiplier: 0.6, title: "2/16"),
                                   .init(value: "6k", heigntMultiplier: 0.7, title: "2/17"),])
        
        statsView.configure(with: [.topic01(value: "155"),
                                   .topic02(value: "8'20''"),
                                   .topic03(value: "7,682"),
                                   .topic04(value: "8.25")])
        
        
    }
}

