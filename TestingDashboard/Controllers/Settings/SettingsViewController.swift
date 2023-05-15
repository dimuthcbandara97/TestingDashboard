//
//  SettingsViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit


class SettingsBaseController: BaseController, UITableViewDataSource, UITableViewDelegate, CollectionTableViewCellDelegate3, CollectionTableViewCellDelegate4 {
    
    // MARK: DidTap -> Model 04
    func collectionTableViewCellDidTapItem(with viewModel4: TitleCollectionViewCellViewModel4) {

        let alert = UIAlertController(title: viewModel4.name, message: viewModel4.details, preferredStyle: .alert)
        
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
        let alert = UIAlertController(title: viewModel3.name, message: viewModel3.details, preferredStyle: .alert)
        
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
        
        // Load Nutrition
        apiCaller.loadNutrition { [weak self] nutritionElements in
            guard let self = self else { return }
            
            // Convert the exercise elements to view models
            let titleViewModels = nutritionElements.map { TitleCollectionViewCellViewModel3(name: $0.foodName, backgroundColor: .systemRed, imageURL: URL(string: $0.imageurl), details: $0.value, videoURL: URL(string: $0.videourl)) }
            
            // Create the collection view cell view models
            let collectionViewModels = [CollectionTableViewCellViewModel3(viewModels: titleViewModels)]
            
            // Assign the view models to the property
            self.viewModels3 = collectionViewModels
            
            // Reload the table view to display the new data
//            self.tableView.reloadData()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        // Load Exercise
        apiCaller.loadExercise { [weak self] nutritionElements in
            guard let self = self else { return }
            
            // Convert the exercise elements to view models
            let titleViewModels = nutritionElements.map { TitleCollectionViewCellViewModel(name: $0.exerciseName, backgroundColor: .systemRed, imageURL: URL(string: $0.imageurl), details: $0.notes, videoURL: URL(string: $0.videourl)) }
            
            // Create the collection view cell view models
            let collectionViewModels = [CollectionTableViewCellViewModel(viewModels: titleViewModels)]
            
            // Assign the view models to the property
            self.viewModels = collectionViewModels
            
            // Reload the table view to display the new data
//            self.tableView.reloadData()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        apiCaller.loadMeditation { [weak self] nutritionElements in
            guard let self = self else { return }
            
            // Convert the exercise elements to view models
            let titleViewModels = nutritionElements.map { TitleCollectionViewCellViewModel4(name: $0.meditationName, backgroundColor: .systemRed, imageURL: URL(string: $0.imageurl), details: $0.notes, videoURL: URL(string: $0.videourl)) }
            
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
        navigationItem.title = "Health Controller"
     fetchData()
    }
    
    
    override func setupViews() {
        super.setupViews()
        view.setupView(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModels.count
        } else if section == 1 {
//            return customViewModels.count
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
            return view.frame.size.width/2.5
//            return UITableView.automaticDimension
        } else if indexPath.section == 1{
//            return UITableView.automaticDimension
            return view.frame.size.width/2.5
        } else {
//            return UITableView.automaticDimension
            return view.frame.size.width/2.5
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Exericse Section"
        } else if section == 1 {
            return "Nutrition Section"
        } else {
            return "Meditation Section"
        }
    }

}

extension SettingsBaseController: CollectionTableViewCellDelegate{

    func collectionTableViewCellDidTapItem(with viewModel: TitleCollectionViewCellViewModel) {
        let alert = UIAlertController(title: viewModel.name, message: viewModel.details, preferredStyle: .alert)
        
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
