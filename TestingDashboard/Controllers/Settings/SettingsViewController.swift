//
//  SettingsViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit


class SettingsBaseController: BaseController, UITableViewDataSource, UITableViewDelegate {
    

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.register(CustomTableViewCell3.self, forCellReuseIdentifier: CustomTableViewCell3.identifier)
        table.register(CustomTableViewCell4.self, forCellReuseIdentifier: CustomTableViewCell4.identifier)
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
            return viewModels.count
        } else {
            return viewModels.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let viewModel = viewModels[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {fatalError()}
            cell.delegate = self
            cell.configure(with: viewModel)
            return cell
        } else  if indexPath.section == 1 {
//            let viewModel = customViewModels[indexPath.row]
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell3.identifier, for: indexPath) as? CustomTableViewCell else {fatalError()}
//            cell.textLabel?.text = viewModel.title
//            cell.detailTextLabel?.text = viewModel.subtitle
//            return cell
            let viewModel = viewModels[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {fatalError()}
            cell.delegate = self
            cell.configure(with: viewModel)
            return cell
        } else {
            let viewModel = viewModels[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {fatalError()}
            cell.delegate = self
            cell.configure(with: viewModel)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return view.frame.size.width/2
        } else if indexPath.section == 1{
            return UITableView.automaticDimension
        } else {
            return UITableView.automaticDimension
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
