//
//  WebViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-21.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    private let webView = WKWebView()
    
    // url String setu
    private let urlString: String
       
       init(with urlString: String) {
           self.urlString = urlString
           super.init(nibName: nil, bundle: nil)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
        // seting up the UI
        self.setupUI()
           
           guard let url = URL(string: self.urlString) else {
               self.dismiss(animated: true, completion: nil)
               return
           }
           
           self.webView.load(URLRequest(url: url))
           
           // TODO: - GIT BEFORE CODING
       }
       
       private func setupUI() {
           
           // Setting up the Bar Button Item
           self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
           self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
           
           self.view.addSubview(webView)
           self.webView.translatesAutoresizingMaskIntoConstraints = false
           
           // Adding constraints
           NSLayoutConstraint.activate([
               self.webView.topAnchor.constraint(equalTo: self.view.topAnchor),
               self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
               self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
               self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
           ])
       }
       
    // checking the Taps
    @objc private func didTapDone() {
           self.dismiss(animated: true, completion: nil)
       }


}
