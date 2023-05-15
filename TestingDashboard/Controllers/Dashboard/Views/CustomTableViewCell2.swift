//
//  CustomTableViewCell2.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-22.
//

import Foundation
import UIKit

class CustomTableViewCell2: UITableViewCell {
    
    let topicLabel = UILabel()
    let subheadLabel = UILabel()
    let customImageView = UIImageView()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
        subheadLabel.translatesAutoresizingMaskIntoConstraints = false
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(topicLabel)
        contentView.addSubview(subheadLabel)
        contentView.addSubview(customImageView)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
