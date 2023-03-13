//
//  ViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-11.
//

import UIKit
import Supabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
        
    }

    func layout() {
        let customScrollView = UIScrollView(frame: view.bounds)
        customScrollView.contentSize = CGSize(width: view.bounds.size.width, height: 1500)

        let redView = UIView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        let greenView = UIView(frame: CGRect(x: 150, y: 160, width: 150, height: 200))
        let blueView = UIView(frame: CGRect(x: 40, y: 400, width: 200, height: 150))
        let yellowView = UIView(frame: CGRect(x: 100, y: 600, width: 180, height: 150))

        redView.backgroundColor = .systemRed
        greenView.backgroundColor = .systemGreen
        blueView.backgroundColor = .systemBlue
        yellowView.backgroundColor = .systemYellow

        customScrollView.addSubview(redView)
        customScrollView.addSubview(greenView)
        customScrollView.addSubview(blueView)
        customScrollView.addSubview(yellowView)

        view = customScrollView
        
        
    }
}

