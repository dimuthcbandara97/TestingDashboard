//
//  Progress2View.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-20.
//

import Foundation
import UIKit

final class Progress2View: BaseInfoView {
   

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
    
        return view
    }()
    

     func configure(with itmes: [StatsItem2]) {
         itmes.forEach {
             let itmeView = StatsItemView2()
             itmeView.configure(with: $0)
             stackView.addArrangedSubview(itmeView)
         }
     }
       }



extension Progress2View {

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

