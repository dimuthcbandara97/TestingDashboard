//
//  SectionHeaderView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-14.
//

import UIKit


class SectionHeaderView: BaseView {
    
    var tableView = UITableView()
    
    var videos: [Video] = []
    
   
    struct Cellls{
        static let exerciseCell = "ExerciseCell"
    }

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
        videos = fetchData()
    }
    
    
}


// Extension of DashboardNavBar

extension SectionHeaderView: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cellls.exerciseCell) as! ExerciseViewCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        
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
        tableView.register(ExerciseViewCell.self, forCellReuseIdentifier: "ExerciseCell")
        
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
//    function to fetchData
    func fetchData() -> [Video]{
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
        
        return [video1, video2, video3, video4,video5,video6,video7,video8,video9,video10]
    }

}
