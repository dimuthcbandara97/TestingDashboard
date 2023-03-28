//
//  ExerciseViewCell.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-23.
//

import UIKit

class ExerciseViewCell: UITableViewCell {

//    var videoImageView = UIImageView()
//    var videoTitleLabel = UILabel()
    
    private let videoImageView: UIImageView = {
        let video = UIImageView()
//        video.contentMode = .scaleAspectFill
        video.clipsToBounds = false
        video.layer.cornerRadius = 4
        return video
    }()
    
    private let videoTitleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .systemPink
        title.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        title.numberOfLines = 2
        title.lineBreakMode = .byTruncatingTail
        return title
    }()
   
    
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


