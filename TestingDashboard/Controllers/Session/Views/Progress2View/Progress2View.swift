//
//  Progress2View.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-20.
//

import Foundation
import UIKit

final class Progress2View: BaseInfoView {
   
     private let barsView = BaseBarsView()
     
     func configure(with items: [BaseBarView.Data]) {
         barsView.configureX(with: items)
           }
       }



extension Progress2View {
   
    override func setupViews() {
       super.setupViews()
       
       setupView(barsView)
   }
   
    // MARK: Add Constraints
    override func constaintViews(){
       super.constaintViews()
     
       NSLayoutConstraint.activate([
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

