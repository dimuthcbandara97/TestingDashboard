//
//  StatsItemView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-16.
//

import Foundation
import UIKit

enum StatsItem {
    case topic01(value: String)
    case topic02(value: String)
    case topic03(value: String)
    case topic04(value: String)
    
    var data: StatsItemView.ItemData {
        switch self {
        case .topic01(let value):
            return StatsItemView.ItemData(image: UIImage(systemName: "bolt.heart"),
                                          value: value + "",
                                          title: "B.Pressure")
        case .topic02(let value):
            return StatsItemView.ItemData(image: UIImage(systemName: "heart.fill"),
                                          value: value + "",
                                          title: "Heart Rate")
        case .topic03(let value):
            return StatsItemView.ItemData(image: UIImage(systemName: "chart.bar.xaxis"),
                                          value: value + "",
                                          title: "BMI")
        case .topic04(let value):
            return StatsItemView.ItemData(image: UIImage(systemName: "figure.walk.circle"),
                                          value: value,
                                          title: "Body Fat")
        }
    }
}

// MARK: Extension
class StatsItemView: BaseView {
    
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
    func configure(with item: StatsItem) {
        imageView.image = item.data.image
        valueLabel.text = item.data.value
        titleLabel.text = item.data.title.uppercased()
    }
}

extension StatsItemView {
    
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
