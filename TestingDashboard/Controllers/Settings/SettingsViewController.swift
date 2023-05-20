//
//  SettingsViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit
import SwiftKeychainWrapper
import AVKit


class SettingsBaseController: BaseController, UITableViewDataSource, UITableViewDelegate, CollectionTableViewCellDelegate3, CollectionTableViewCellDelegate4 {
    
//    private let logoutButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Logout", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        button.setTitleColor(.red, for: .normal)
//        button.backgroundColor = .white
//        button.layer.cornerRadius = 8
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.red.cgColor
//        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    private let changeDetailsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Details", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(changeDetailsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc private func changeDetailsButtonTapped() {
        // Handle the change details button tap event here
    }

    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change User Details", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    
    @objc private func logoutButtonTapped() {
        let vc = ChangeDetailsUserController()
        self.navigationController?.pushViewController(vc, animated: true)
       }
    
    // MARK: DidTap -> Model 04
    func collectionTableViewCellDidTapItem(with viewModel4: TitleCollectionViewCellViewModel4) {
        
        let alert = UIAlertController(title: viewModel4.name, message: "Fitness Goal: "+viewModel4.fitnessGoal+"\n\n"+viewModel4.details, preferredStyle: .alert)
        
        // Add action to open YouTube
        alert.addAction(UIAlertAction(title: "View Video", style: .default, handler: { _ in
            // Open YouTube URL
            if let youtubeURL = viewModel4.videoURL {
                UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
            }
        }))
        
        // Add cancel action
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
    // MARK: DidTap -> Model 05
    func collectionTableViewCellDidTapItem(with viewModel3: TitleCollectionViewCellViewModel3) {
        let alert = UIAlertController(title: viewModel3.name, message: "Fitness Goal: "+viewModel3.fitnessGoal+"\n\n"+viewModel3.details, preferredStyle: .alert)
        
        // Add action to open YouTube
        alert.addAction(UIAlertAction(title: "View Video", style: .default, handler: { _ in
            // Open YouTube URL
            if let youtubeURL = viewModel3.videoURL {
                UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
            }
        }))
        
        // Add cancel action
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
    
    // MARK: Table View
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.register(CollectionTableViewCell3.self, forCellReuseIdentifier: CollectionTableViewCell3.identifier)
        table.register(CollectionTableViewCell4.self, forCellReuseIdentifier: CollectionTableViewCell4.identifier)
        return table
    }()
    
    
    // MARK: Variable Declartion
    private let apiCaller = APICaller()
    private var viewModels: [CollectionTableViewCellViewModel] = []
    private var viewModels3: [CollectionTableViewCellViewModel3] = []
    private var viewModels4: [CollectionTableViewCellViewModel4] = []
    
    func fetchData() {
        let keychain = KeychainWrapper.standard
        //
        func getUserDetailsFitnessGoal() -> String? {
            return keychain.string(forKey: "userDetailsFitnessGoal")
        }
        
        func getUserDetailsHeight() -> Int? {
            return keychain.integer(forKey: "userDetailsHeight")
        }
        
        func getUserDetailsWeight() -> Int? {
            return keychain.integer(forKey: "userDetialsWeight")
        }
        
        func getUserDetailsAge() -> Int? {
            return keychain.integer(forKey: "userDetialsAge")
        }
        
        func getUserDetailsStatus() -> String? {
            return keychain.string(forKey: "userDetialsStatus")
        }
        // Load Nutrition
        apiCaller.loadNutrition { [weak self] nutritionElements in
            guard let self = self else { return }
            
            // Get the fitness goal from keychain
            guard let fitnessGoal = getUserDetailsFitnessGoal() else {
                // Fitness goal not found in keychain, handle the error case
                return
            }
            
            // Filter the nutrition elements based on fitness goal
            let filteredElements = nutritionElements.filter { $0.fitnessGoal == fitnessGoal }
            
            // Convert the filtered exercise elements to view models
            let titleViewModels = filteredElements.map { TitleCollectionViewCellViewModel3(name: $0.foodName, backgroundColor: .systemRed, imageURL: URL(string: $0.imageurl), details: $0.value, videoURL: URL(string: $0.videourl), fitnessGoal: $0.fitnessGoal) }
            
            // Create the collection view cell view models
            let collectionViewModels = [CollectionTableViewCellViewModel3(viewModels: titleViewModels)]
            
            // Assign the view models to the property
            self.viewModels3 = collectionViewModels
            
            // Reload the table view to display the new data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
        // Load Exercise
        apiCaller.loadExercise { [weak self] nutritionElements in
            guard let self = self else { return }
            
            // Get the fitness goal from keychain
            guard let fitnessGoal = getUserDetailsFitnessGoal() else {
                // Fitness goal not found in keychain, handle the error case
                return
            }
            
            // Filter the nutrition elements based on fitness goal
            let filteredElements = nutritionElements.filter { $0.fitnessGoal == fitnessGoal }
            
            // Convert the filtered exercise elements to view models
            let titleViewModels = filteredElements.map { TitleCollectionViewCellViewModel(name: $0.exerciseName, backgroundColor: .systemRed, imageURL: URL(string: $0.imageurl), details: $0.notes, videoURL: URL(string: $0.videourl), exerciseTime: $0.exerciseTime, repCount: $0.repCount, fitnessGoal: $0.fitnessGoal) }
            
            // Create the collection view cell view models
            let collectionViewModels = [CollectionTableViewCellViewModel(viewModels: titleViewModels)]
            
            // Assign the view models to the property
            self.viewModels = collectionViewModels
            
            // Reload the table view to display the new data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
        apiCaller.loadMeditation { [weak self] nutritionElements in
            guard let self = self else { return }
            
            // Convert the exercise elements to view models
            let titleViewModels = nutritionElements.map { TitleCollectionViewCellViewModel4(name: $0.meditationName, backgroundColor: .systemRed, imageURL: URL(string: $0.imageurl), details: $0.notes, videoURL: URL(string: $0.videourl), fitnessGoal: $0.fitnessGoal) }
            
            // Create the collection view cell view models
            let collectionViewModels = [CollectionTableViewCellViewModel4(viewModels: titleViewModels)]
            
            // Assign the view models to the property
            self.viewModels4 = collectionViewModels
            
            // Reload the table view to display the new data
            //            self.tableView.reloadData()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a container view to hold the titleLabel
        let containerView = UIView()
        
        // Create a custom UILabel for the navigation title
        let titleLabel = UILabel()
        titleLabel.text = "Details"
        titleLabel.textColor = UIColor.red
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        
        // Add the titleLabel to the containerView
        containerView.addSubview(titleLabel)
        
        // Apply constraints to position the titleLabel within the containerView
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -30)  
        ])
        
        // Set the containerView as the titleView of the navigation item
        navigationItem.titleView = containerView
        
        fetchData()
        view.addSubview(logoutButton)
               
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])


    }
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        // Adjust the content inset of the table view
        tableView.contentInset = UIEdgeInsets(top: -25, left: 0, bottom: 0, right: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModels.count
        } else if section == 1 {
            return viewModels3.count
        } else {
            return viewModels4.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //MARK: Exercise Section
        if indexPath.section == 0 {
            let viewModel = viewModels[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {fatalError()}
            cell.delegate = self
            cell.configure(with: viewModel)
            return cell
        }
        // MARK: Nutrition Section
        else  if indexPath.section == 1 {
            let viewModel = viewModels3[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell3.identifier, for: indexPath) as? CollectionTableViewCell3 else {fatalError()}
            cell.delegate = self
            cell.configure(with: viewModel)
            return cell
        }
        // MARK: Other Section
        else {
            let viewModel = viewModels4[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell4.identifier, for: indexPath) as? CollectionTableViewCell4 else {fatalError()}
            cell.delegate = self
            cell.configure(with: viewModel)
            return cell
        }
    }
    
    // MARK: TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return view.frame.size.width/2.7
        } else if indexPath.section == 1{
            return view.frame.size.width/2.7
        } else {
            return view.frame.size.width/2.7
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Exercises To Gain Your Goal"
        } else if section == 1 {
            return "Nutrition To Gain Your Goal"
        } else {
            return "Meditation To Gain Your Goal"
        }
    }
    
}

extension SettingsBaseController: CollectionTableViewCellDelegate{
    
    func collectionTableViewCellDidTapItem(with viewModel: TitleCollectionViewCellViewModel) {
        
        let exerciseTimeString = String(viewModel.exerciseTime)
        let repCokuntString = String(viewModel.repCount)
        let alert = UIAlertController(title: viewModel.name, message: "Time Period  (Seconds) = "+exerciseTimeString+"\n Rep Count =  "+repCokuntString+"\n"+"Fitness Goal: "+viewModel.fitnessGoal+"\n\n"+viewModel.details, preferredStyle: .alert)
        
        
        // Add action to open YouTube
        alert.addAction(UIAlertAction(title: "View Video", style: .default, handler: { _ in
            // Open YouTube URL
            if let youtubeURL =  viewModel.videoURL {
                UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
            }
        }))
        
        
        // Add cancel action
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
}
