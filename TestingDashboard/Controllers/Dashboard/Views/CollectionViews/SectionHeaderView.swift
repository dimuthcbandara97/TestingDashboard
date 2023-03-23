//
//  SectionHeaderView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-14.
//

import UIKit


class SectionHeaderView: BaseView {
    
    var tableView = UITableView()

    private let titlelabel: UILabel = {
        let label = UILabel()
        label.text = "Your Exercises"
        label.textColor = .black
        return label
    }()
    
    
    // layout subViews Here
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Addig for all subviews!
        addBottomBorder(with:.systemBlue, height: 1)
    }
    
    
}


// Extension of DashboardNavBar

extension SectionHeaderView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
   
    override func setupViews() {
        super.setupViews()
        
        setupView(titlelabel)
        setupView(tableView)
        setTableViewDelegates()
//        tableView.pin(to: this.view)
    }
   
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        
        
        
    }
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([

            
            titlelabel.topAnchor.constraint(equalTo: topAnchor),
            tableView.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
   
    override func configureAppearance() {
        super.configureAppearance()
     
        backgroundColor = .white

        
      
    }
}

// Extension of SectioonHesderView

extension SectionHeaderView{
//    func fe
}
