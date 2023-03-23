//
//  ExerciseViewCell.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-23.
//

import UIKit

class ExerciseViewCell: UITableViewCell {

    var videoImageView = UIImageView()
    var videoTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(videoImageView)
        addSubview(videoTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstaints()
        setTitleLabelConstaints()
    }
    
    func set(video: Video){
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView(){
        videoImageView.layer.cornerRadius = 10
        videoImageView.clipsToBounds = true
    }
    func configureTitleLabel(){
        videoTitleLabel.numberOfLines = 0
        videoTitleLabel.adjustsFontSizeToFitWidth = true
    }
    func setImageConstaints(){
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12).isActive = true
        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    func setTitleLabelConstaints(){
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        videoTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20).isActive = true
        videoTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}


