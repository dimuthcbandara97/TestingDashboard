//
//  StatsItemView22.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-05-19.
//


import Foundation
import UIKit

enum StatsItem2 {
    case topic01(value: String)
    case topic02(value: String)
    case topic03(value: String)
    case topic04(value: String)
    
    var data: StatsItemView2.ItemData {
        switch self {
        case .topic01(let value):
            return StatsItemView2.ItemData(image: UIImage(systemName: "person.fill"),
                                           value: "\(value)",
                                           title: "Age")
        case .topic02(let value):
            return StatsItemView2.ItemData(image: UIImage(systemName: "ruler"),
                                           value: "\(value)",
                                           title: "Height")
        case .topic03(let value):
            return StatsItemView2.ItemData(image: UIImage(systemName: "rectangle.3.offgrid"),
                                           value: "\(value)",
                                           title: "Weight")
        case .topic04(let value):
            return StatsItemView2.ItemData(image: UIImage(systemName: "heart.text.square"),
                                           value: "\(value)",
                                           title: "BMI")
        }
    }
    
}

// MARK: Extension
class StatsItemView2: BaseView {
    
    // CONFIGURE STRUC
    struct ItemData {
        let image: UIImage?
        let value: String
        let title: String
    }
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = false
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    //     imageView.contentMode = .scaleAspectFit
    //     imageView.clipsToBounds = true
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .purple
        label.textAlignment = .center
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fillProportionally
        view.spacing = 5
        return view
    }()
    
    
    // CONFIGURE FUNC
    func configure(with item: StatsItem2) {
        imageView.image = item.data.image
        valueLabel.text = item.data.value
        titleLabel.text = item.data.title.uppercased()
    }
}

extension StatsItemView2 {
    
    // MARK: Setup Views
    override func setupViews(){
        super.setupViews()
        
        setupView(imageView)
        setupView(stackView)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(titleLabel)
    }
    
    // MARK: Constraint Views
    override func constaintViews(){
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 23),
            
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func configureAppearance(){
        super.configureAppearance()
    }
}
