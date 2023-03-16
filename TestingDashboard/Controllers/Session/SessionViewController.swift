//
//  SessionViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit

final class SessionBaseController: BaseController {
    
    
    private let timerView = TimerView()

    
    private let timerDuration = 5.0
    
    override func navBarLeftButtonHandler() {

    }
    
    override func navBarRightButtonHanler() {

    }
}

extension SessionBaseController {
    override func setupViews() {
        
        view.backgroundColor = .white
        super.setupViews()
        
        view.setupView(timerView)

    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            

        ])
    }
    
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = OverallController.Strings.NavBar.session
        navigationController?.tabBarItem.title = OverallController.Strings.TabBar.title(for: .session)

        
        timerView.configure(with: timerDuration, progress: 0)
        
        timerView.callBack = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.navBarRightButtonHanler()
            }
        }
        
        //        timerView.callBack = { [weak self] in
        //            self?.navBarRightButtonHandler()
        //        }
        
        
    }
}

