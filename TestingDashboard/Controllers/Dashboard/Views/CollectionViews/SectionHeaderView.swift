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
        label.shadowColor = .gray
        label.shadowOffset = CGSize(width: 1.0, height: 1.0)
//        label.shadowOpacity = 0.5
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
//        cell.textLabel?.text = .name
//            cell.detailTextLabel?.text = user.email
        cell.set(exercise: exercise)
            return cell

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
        tableView.register(ExerciseViewCell.self, forCellReuseIdentifier: Cellls.exerciseCell)
    }
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

// Extension of SectioonHesderView

extension SectionHeaderView{
//    function to fetchData
    
    func fetchData() -> [ExerciseElement]{
        let video1 = Video(image: Imagess.noStoryboard! , title: "No Storyboard")
        let video2 = Video(image: Imagess.xcode!, title: "Soft Skills")
        let video3 = Video(image: Imagess.patreon!, title: "Soft Skills")
        let video4 = Video(image: Imagess.raise!, title: "Soft Skills")
        let video5 = Video(image: Imagess.shake!, title: "Soft Skills")
        let video6 = Video(image: Imagess.salaries!, title: "Soft Skills")
        let video7 = Video(image: Imagess.wireless!, title: "Soft Skills")
        let video8 = Video(image: Imagess.softSkills!, title: "Soft Skills")
        let video9 = Video(image: Imagess.swiftNews!, title: "Soft Skills")
        let video10 = Video(image: Imagess.ninety!, title: "Soft Skills")

        return []
        
    }

}
