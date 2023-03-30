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
}

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    private let label: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .systemPink
        contentView.addSubview(label)
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
    }
    
    func configure(with viewModel: TitleCollectionViewCellViewModel){
        contentView.backgroundColor = viewModel.backgroundColor
        label.text = viewModel.name
    }
}
