//
//  ProgressView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-16.
//

import Foundation
import UIKit

final class ProgressView: BaseInfoView {
   
     private let barsView = BaseBarsView()
     
   
     func configure(with items: [BaseBarView.Data]) {
         barsView.configureX(with: items)
           }
       }



extension ProgressView{
   
    override func setupViews() {
       super.setupViews()
       
       setupView(barsView)
   }
   
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
