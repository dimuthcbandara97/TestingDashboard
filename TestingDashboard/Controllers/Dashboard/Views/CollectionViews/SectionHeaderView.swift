//
//  SectionHeaderView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-14.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
        
    static let id = "Dashboard Header"
    
    private let title: UILabel = {
        let lable = UILabel()
//        lable.font =
        lable.textColor = .systemBlue
        lable.textAlignment = .center
        return lable
    }()
    
    func configure(with title: String) {
        self.title.text = title
    }
}

private extension SectionHeaderView {
    

    
     func setupViews() {
        
//        setupView(title)
       
    }
     func constaintViews() {
  
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
          
        ])
    }
    
    func configureAppeatance() {
    }

}

