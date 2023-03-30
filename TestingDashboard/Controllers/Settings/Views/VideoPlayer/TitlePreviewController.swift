//
//  TitlePreviewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-30.
//

import UIKit
import AVKit

import UIKit
import AVKit

class TitlePreviewViewController: UIViewController {
    
    var playerViewController = AVPlayerViewController()
    let videoURL = URL(string: "https://www.youtube.com/embed/LFttJXxhgVk")!
    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add title label
        titleLabel.text = "Video Title"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
        
        // Add player view
        let playerView = UIView()
        playerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            playerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            playerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            playerView.heightAnchor.constraint(equalToConstant: 240),
        ])
        
        // Add player layer to player view
        let player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = playerView.bounds
        playerView.layer.addSublayer(playerLayer)
        player.play()
        
        // Add play/pause button
        let playButton = UIButton(type: .system)
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playButton)
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: playerView.bottomAnchor, constant: 16),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        playButton.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
        
        // Set up player view controller
        playerViewController.player = player
    }
    
    @objc func playPauseButtonTapped() {
        if playerViewController.player?.rate == 0 {
            playerViewController.player?.play()
            (view.subviews.first { $0 is UIButton } as? UIButton)?.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        } else {
            playerViewController.player?.pause()
            (view.subviews.first { $0 is UIButton } as? UIButton)?.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
}
