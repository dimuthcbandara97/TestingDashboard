//
//  MonthlyPerformanceView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation
import UIKit

final class MonthlyPerformanceView: BaseInfoView {
    
    private let chartsView = BaseChartsView()
    
    func configure(with items: [BaseChartsView.Data], topChartOffset: Int) {
        chartsView.configureX(with: items, topChartOffset: topChartOffset)
    }
}

extension MonthlyPerformanceView {
  
   override func setupViews() {
      super.setupViews()
      
      setupView(chartsView)
  }
  
  override func constaintViews(){
      super.constaintViews()
    
      NSLayoutConstraint.activate([
        chartsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
        chartsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        chartsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        chartsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
      ])
  }
  
  override func configureAppearance(){
      super.configureAppearance()
      
  }
}
