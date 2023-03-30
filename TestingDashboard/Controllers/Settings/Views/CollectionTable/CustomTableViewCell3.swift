//
//  CustomTableViewCell3.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-30.
//

import UIKit


class CustomTableViewCell3: UITableViewCell {
    
    static let identifier = "CustomTableViewCell3"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add any subviews or layout constraints for the custom cell here
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

