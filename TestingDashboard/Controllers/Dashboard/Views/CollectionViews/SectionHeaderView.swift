//
//  SectionHeaderView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-14.
//

import UIKit


class SectionHeaderView: BaseView {
    
    var tableView = UITableView()
    
    var exercises = [ExerciseElement]()
    
    
    struct Cellls{
        static let exerciseCell = "ExerciseCell"
    }
    
    private let titlelabel: UILabel = {
        let label = UILabel()
        label.text = "Your Exercises"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .clear
        label.layer.shadowColor = UIColor.clear.cgColor  // Remove shadow
        label.layer.masksToBounds = true  // Add padding
        
        return label
    }()
    
    
    // layout subViews Here
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Addig for all subviews!
        addBottomBorder(with:.systemBlue, height: 1)
        APICaller.shared.loadExercise { exercises in
            self.exercises = exercises
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}


// Extension of DashboardNavBar

extension SectionHeaderView: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cellls.exerciseCell) as! ExerciseViewCell
        let exercise = exercises[indexPath.row]
        cell.set(exercise: exercise)
        return cell
        
    }
    
    // MARK: Setup Views
    override func setupViews() {
        super.setupViews()
        
        setupView(titlelabel)
        setupView(tableView)
        setTableViewDelegates()
        //        tableView.pin(to: this.view)
    }
    
    // MARK: Set Table View Delegate
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.register(ExerciseViewCell.self, forCellReuseIdentifier: Cellls.exerciseCell)
    }
    
    // MARK: Constraints
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            
            titlelabel.topAnchor.constraint(equalTo: topAnchor),
            titlelabel.heightAnchor.constraint(equalToConstant: 30),
            titlelabel.centerXAnchor.constraint(equalTo: centerXAnchor), // Add this line
            
            tableView.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
    }
}


