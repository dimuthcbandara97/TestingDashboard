//
//  CustomTableViewCell4.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-30.
//

import Foundation
import UIKit

class CustomTableViewCell4: UITableViewCell {
    
    static let identifier = "CustomTableViewCell4"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add any subviews or layout constraints for the custom cell here
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
