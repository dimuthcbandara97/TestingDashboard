//
//  Progress2View.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-20.
//

import Foundation
import UIKit

final class Progress2View: BaseInfoView {
   
//     private let barsView = BaseBarsView()
//
//     func configure(with items: [BaseBarView.Data]) {
//         barsView.configureX(with: items)
//           }
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
    
        return view
    }()
    

     func configure(with itmes: [StatsItem]) {
         itmes.forEach {
             let itmeView = StatsItemView()
             itmeView.configure(with: $0)
             stackView.addArrangedSubview(itmeView)
         }
     }
       }



extension Progress2View {
   
//    override func setupViews() {
//       super.setupViews()
//       
//       setupView(barsView)
//   }
//   
//    // MARK: Add Constraints
//    override func constaintViews(){
//       super.constaintViews()
//     
//       NSLayoutConstraint.activate([
//        barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
//        barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//        barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//        barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
//       ])
//   }
//   
//   override func configureAppearance(){
//       super.configureAppearance()
//   }
    override func setupViews() {
        super.setupViews()
        setupView(stackView)
    }
     
     // MARK: Constraints
    override func constaintViews(){
        super.constaintViews()
      
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }
    
    override func configureAppearance(){
        super.configureAppearance()
    }
}

