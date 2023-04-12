//
//  SettingsViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit


class SettingsBaseController: BaseController, UITableViewDataSource, UITableViewDelegate, CollectionTableViewCellDelegate3, CollectionTableViewCellDelegate4 {
    func collectionTableViewCellDidTapItem(with viewModel4: TitleCollectionViewCellViewModel4) {
        let alert = UIAlertController(title: viewModel4.name, message: "Selected", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: nil))
        present(alert,animated: true)
    }
    
    
    func collectionTableViewCellDidTapItem(with viewModel3: TitleCollectionViewCellViewModel3) {
        let alert = UIAlertController(title: viewModel3.name, message: "Selected", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: nil))
        present(alert,animated: true)
    }
    
    

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.register(CollectionTableViewCell3.self, forCellReuseIdentifier: CollectionTableViewCell3.identifier)
        table.register(CollectionTableViewCell4.self, forCellReuseIdentifier: CollectionTableViewCell4.identifier)
        return table
    }()


    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(viewModels: [
            TitleCollectionViewCellViewModel(name: "Topic 01", backgroundColor: .systemPink),
            TitleCollectionViewCellViewModel(name: "Topic 02", backgroundColor: .systemRed),
            TitleCollectionViewCellViewModel(name: "Topic 03", backgroundColor: .systemOrange),
            
            TitleCollectionViewCellViewModel(name: "Topic 0", backgroundColor: .systemPink),
            TitleCollectionViewCellViewModel(name: "Topic 0", backgroundColor: .systemPink),
            TitleCollectionViewCellViewModel(name: "Topic 0", backgroundColor: .systemPink),
        ])
    ]
    
    // edit this
    private let viewModels3: [CollectionTableViewCellViewModel3] = [
        CollectionTableViewCellViewModel3(viewModels: [
            TitleCollectionViewCellViewModel3(name: "Model 01", backgroundColor: .systemPink),
            TitleCollectionViewCellViewModel3(name: "Model 02", backgroundColor: .systemRed),
            TitleCollectionViewCellViewModel3(name: "Model 03", backgroundColor: .systemOrange),
            
            TitleCollectionViewCellViewModel3(name: "Model 04", backgroundColor: .systemPink),
            TitleCollectionViewCellViewModel3(name: "Model 05", backgroundColor: .systemPink),
            TitleCollectionViewCellViewModel3(name: "Model 06", backgroundColor: .systemPink),
        ])
    ]
    
    // edit this
    private let viewModels4: [CollectionTableViewCellViewModel4] = [
        CollectionTableViewCellViewModel4(viewModels: [
            TitleCollectionViewCellViewModel4(name: "04", backgroundColor: .systemPink),
            TitleCollectionViewCellViewModel4(name: "04", backgroundColor: .systemRed),
            TitleCollectionViewCellViewModel4(name: "04", backgroundColor: .systemOrange),
            
            TitleCollectionViewCellViewModel4(name: "04", backgroundColor: .systemPink),
            TitleCollectionViewCellViewModel4(name: "04", backgroundColor: .systemPink),
            TitleCollectionViewCellViewModel4(name: "04", backgroundColor: .systemPink),
        ])
    ]
//    private let customViewModels: [CustomTableViewCellViewModel] = [
//        CustomTableViewCellViewModel(title: "Custom Item 1", subtitle: "Custom Subtitle 1"),
//        CustomTableViewCellViewModel(title: "Custom Item 2", subtitle: "Custom Subtitle 2"),
//        CustomTableViewCellViewModel(title: "Custom Item 3", subtitle: "Custom Subtitle 3"),
//    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Health Controller"
     
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
        // Section 01 -> Exercise Section 
        if indexPath.section == 0 {
            let viewModel = viewModels[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {fatalError()}
            cell.delegate = self
            cell.configure(with: viewModel)
            return cell
        }
        else  if indexPath.section == 1 {
            let viewModel = viewModels3[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell3.identifier, for: indexPath) as? CollectionTableViewCell3 else {fatalError()}
            cell.delegate = self
            cell.configure(with: viewModel)
            return cell
        }
        else {
            let viewModel = viewModels4[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell4.identifier, for: indexPath) as? CollectionTableViewCell4 else {fatalError()}
            cell.delegate = self
            cell.configure(with: viewModel)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return view.frame.size.width/3
//            return UITableView.automaticDimension
        } else if indexPath.section == 1{
//            return UITableView.automaticDimension
            return view.frame.size.width/3
        } else {
//            return UITableView.automaticDimension
            return view.frame.size.width/3
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
        let alert = UIAlertController(title: viewModel.name, message: "Selected", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: nil))
        present(alert,animated: true)
    }
}
