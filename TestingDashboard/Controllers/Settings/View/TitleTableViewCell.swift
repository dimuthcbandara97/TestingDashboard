//
//  TitleTableViewCell.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-20.
//

import Foundation
import UIKit
class TitleTableViewCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    static let identifier = "TitleTableViewCell"
    
    // play title button
    private let playTitleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // title label
    private let titlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // title Post Image
    private let titlesPosterUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterUIImageView)
        contentView.addSubview(titlelabel)
        contentView.addSubview(playTitleButton)
        
        applyConstraints()
        }
    
    private func applyConstraints(){
        let titlePosterUIViewConstraints = [
            titlesPosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titlesPosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
//            titlesPosterUIImageView.widthAnchor.constraint(equalTo: 100)
            titlesPosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraints = [
            titlelabel.leadingAnchor.constraint(equalTo: titlesPosterUIImageView.trailingAnchor, constant: 20),
            titlelabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titlePosterUIViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
            fatalError()
        }
    
    public func configure(with model:TitleViewModel){
//        guard let url = URL(string: model.posterURL) else {
//            return
//        }
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else{
            return
        }
        
        titlesPosterUIImageView.sd_setImage(with: url,completed: nil)
        titlelabel.text = model.titleName
    }

}

