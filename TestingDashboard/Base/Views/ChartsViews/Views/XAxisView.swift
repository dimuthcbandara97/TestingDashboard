//
//  XAxisView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation
import UIKit

final  class XAxisView: BaseView {
    
    // MARK: Stack View
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .equalSpacing
        return view
    }()
    
    // MARK: Configure Appeaance
//    func configure(with data: [BaseChartsView.Data]) {
//        stackView.arrangedSubviews.forEach {
//            $0.removeFromSuperview()
//        }
//        data.reversed().forEach {
//            let lable = UILabel()
////            lable.font =
//            lable.textColor = .black
//            lable.textAlignment = .center
//            //lable.textAlignment = .center
//            lable.text = $0.title.uppercased() //TODO: Remake calculated interval
//
//            stackView.addArrangedSubview(lable)
//        }
//    }
    func configure(with data: [BaseChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        data.reversed().forEach { dataItem in
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 14) // Custom font styling
            label.textColor = .black
            label.textAlignment = .center
            label.text = dataItem.title.uppercased()
            
            // Additional label decorations
            label.layer.cornerRadius = 8
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.lightGray.cgColor
            label.clipsToBounds = true
            
            // Add spacing between labels
            label.setContentHuggingPriority(.required, for: .vertical)
            
            stackView.addArrangedSubview(label)
        }
    }

    
}

extension XAxisView {
    
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
        
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}



