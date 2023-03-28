//
//  BaseButton.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-15.
//

import Foundation
import UIKit

public enum WAButtonType {
    case primary
    case secondary
}

final class BaseButton: UIButton {
    
    private var type: WAButtonType = .primary
    

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 0, height: 2)
        label.layer.shadowOpacity = 0.4
        label.layer.shadowRadius = 4
        return label
    }()
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "home")
        return view
    }()
    
    // initialization -> WAButtonType
    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type = type
        
        configureAll()
    }
    
    // initiailization -> NScoder
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        configureAll()
    }
    
    private func configureAll(){
        setupViews()
        constaintViews()
        configureAppearance()
    }
    
    // SetTitle fuction
    func setTitle(_ title: String?) {
        label.text = title
    }
}

private extension BaseButton {
    
    func setupViews() {
        // labe
        setupView(label)
        setupView(iconView)
    }
    
    func constaintViews() {
        
        // horisontalOffset is a computed property
        var horisontalOffset: CGFloat {
            switch type {
            case .primary: return 0
            case .secondary: return 10
            }
        }
        
        NSLayoutConstraint.activate([
            
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horisontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horisontalOffset * 2)
        ])
    }
    
    func configureAppearance() {
        
        switch type {
        
        case .primary:
            label.textColor = .blue
            label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            label.numberOfLines = 0 // allow label to have multiple lines
            label.lineBreakMode = .byWordWrapping // wrap the text at word boundaries

            iconView.tintColor = .systemPurple
            iconView.contentMode = .scaleAspectFit // adjust the icon's content mode
            iconView.clipsToBounds = true // clip the icon's contents to its bounds

            
        
        case .secondary:
            backgroundColor = .systemBackground
            layer.cornerRadius = 14
            label.textColor = .black
//            lable.font =
            iconView.tintColor = .systemCyan
        }
        
        makeSystem(self)
    }
}

