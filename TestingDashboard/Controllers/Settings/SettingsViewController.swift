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
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Section Background Decoration View"
     
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
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Hello Dimuth"
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {fatalError()}
        cell.delegate = self
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/2
    }
    
}

extension SettingsBaseController: CollectionTableViewCellDelegate{
    func collectionTableViewCellDidTapItem(with viewModel: TitleCollectionViewCellViewModel) {
        let alert = UIAlertController(title: viewModel.name, message: "Selected", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: nil))
        present(alert,animated: true)
    }
}
