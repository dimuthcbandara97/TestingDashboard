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
  
    override func setupViews(){
        super.setupViews()

       setupView(stackView)
    }

    override func constaintViews() {
        super.constaintViews()
        // StackView constraints
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: topAnchor),
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -550)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()

        // StackView spacing and distribution
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

