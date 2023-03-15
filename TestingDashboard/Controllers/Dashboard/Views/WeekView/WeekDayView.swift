//
//  WeekDayView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation
import UIKit

extension WeekView {
    final class WeekDaysView: BaseView {
        
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure(with index: Int, and name: String) {
            
            // start, current, and future days
            let startOfWeekDate = Date().startOfWeek
            let currentDay = startOfWeekDate.agoForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            
            let isTooday = currentDay.strioTime() == Date().strioTime()
            
            backgroundColor = isTooday ? .systemGreen : .systemYellow
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isTooday ? .white : .black
            
            
            dateLabel.text = "\(day)"
            dateLabel.textColor = isTooday ? .white : .blue
        }
 
    }
}
    
    extension WeekView.WeekDaysView {
        
        override func setupViews(){
            super.setupViews()

            setupView(stackView)
           
            stackView.addArrangedSubview(nameLabel)
            stackView.addArrangedSubview(dateLabel)
            
        }

        override func constaintViews() {
            super.constaintViews()
            NSLayoutConstraint.activate([
               
                stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
            
            ])
        }

        override func configureAppearance() {
            super.configureAppearance()

            layer.cornerRadius = 5
            layer.masksToBounds = true
                        
//            nameLabel.font =
            nameLabel.textAlignment = .center
             
//            dateLabel.font = 
            dateLabel.textAlignment = .center
            
            stackView.spacing = 3
            stackView.axis = .vertical
        }
    }



