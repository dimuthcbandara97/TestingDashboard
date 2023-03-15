//
//  DailyPerformanceView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation
import UIKit

final class DailyPerformanceView: BaseInfoView {
    
    private let barsView = BaseBarsView()
    
    // Base Bars Configuration
    func configure(with items: [BaseBarView.Data]) {
        barsView.configureX(with: items)
          }
      }

extension DailyPerformanceView {
  
   override func setupViews() {
      super.setupViews()
      
      setupView(barsView)
  }
  
  override func constaintViews(){
      super.constaintViews()
    
      NSLayoutConstraint.activate([
        // LTRB added
       barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
       barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
       barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
       barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
      ])
  }
  
  override func configureAppearance(){
      super.configureAppearance()
  }
}
