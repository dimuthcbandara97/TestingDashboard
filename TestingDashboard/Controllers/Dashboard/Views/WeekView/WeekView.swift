//
//  WeekView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation

import UIKit

final class WeekView: BaseView {
    
    private let calendar = Calendar.current
    private let stackView = UIStackView()
    
}


extension WeekView {
    
    // MARK: Setup Views
    override func setupViews(){
        super.setupViews()
        setupView(stackView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        var weekdays = calendar.shortStandaloneWeekdaySymbols
        
        if calendar.firstWeekday == 1 {
            let sun = weekdays.remove(at: 0)
            weekdays.append(sun)
        }
        
        
        weekdays.enumerated().forEach {index, name in
            
            let view = WeekDaysView()
            view.configure(with: index, and: name)
            
            stackView.addArrangedSubview(view)
            
        }
    }
}

