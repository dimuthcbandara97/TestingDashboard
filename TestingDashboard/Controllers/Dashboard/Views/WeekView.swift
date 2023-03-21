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
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()

        stackView.spacing = 7
        stackView.distribution = .fillEqually
               
        //Настройка календаря
        var weekdays = calendar.shortStandaloneWeekdaySymbols
        
        // Переносим Sunday с первого на последнее место
        if calendar.firstWeekday == 1 {
           let sun = weekdays.remove(at: 0)
            weekdays.append(sun)
        }
        
        // Добавляем WeekDayView
        
        weekdays.enumerated().forEach {index, name in
            
            let view = WeekDaysView()
            view.configure(with: index, and: name)
        
        stackView.addArrangedSubview(view)
        
    }
}
}

