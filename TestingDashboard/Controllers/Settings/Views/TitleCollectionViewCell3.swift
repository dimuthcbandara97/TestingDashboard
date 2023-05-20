//
//  TitleCollectionViewCell3.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-30.
//

import Foundation

import UIKit

struct TitleCollectionViewCellViewModel3 {
    let name: String
    let backgroundColor: UIColor
    let imageURL: URL?
    let details: String
    let videoURL: URL?
    let fitnessGoal: String
}

class TitleCollectionViewCell3: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell3"
    
    // Label
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    // image View
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        contentView.layer.cornerRadius = 6
        contentView.layer.borderWidth = 1.5
        contentView.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layour Sub Views
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
        imageView.frame = contentView.bounds
    }
    
    // MARK: Configure
    func configure(with viewModel3: TitleCollectionViewCellViewModel3){
        contentView.backgroundColor = viewModel3.backgroundColor.withAlphaComponent(0.3) // set the background color with transparency
        if let imageURL = viewModel3.imageURL {
            DispatchQueue.global().async { [weak self] in
                if let imageData = try? Data(contentsOf: imageURL),
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.imageView.alpha = 0.5 // set the image transparency
                        self?.imageView.image = image
                    }
                }
            }
        }
        label.text = viewModel3.name
    }
}
