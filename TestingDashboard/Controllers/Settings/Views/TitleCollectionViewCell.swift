//
//  TitleCollectionViewCell.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-30.
//

import UIKit


struct TitleCollectionViewCellViewModel {
    let name: String
    let backgroundColor: UIColor
    let imageURL: URL?
    let details: String
}

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    private let label: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
        imageView.frame = contentView.bounds
    }
    
    func configure(with viewModel: TitleCollectionViewCellViewModel){
        contentView.backgroundColor = viewModel.backgroundColor.withAlphaComponent(0.3) // set the background color with transparency
        if let imageURL = viewModel.imageURL {
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
        label.text = viewModel.name
    }

}
