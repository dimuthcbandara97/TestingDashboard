//
//  NutritionCollectionViewCell.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-29.
//

import Foundation
import UIKit

class NutritionCollectionViewCell: UICollectionViewCell {
    
    static let identifer = "NutritionCollectionViewCell"
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(postImageView)
    }
    
    required init?(coder:NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            postImageView.frame = contentView.bounds
        }
    
    public func configure(with model: String){
//        guard let url = URL(string: model) else {return}
//        postImageView.sd_setImage(with: url,completed: nil)
        guard let url = URL(string: "\(model)") else{
            return
        }
        
        postImageView.sd_setImage(with: url,completed: nil)
    }
}

