//
//  CustomTableViewCell4.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-30.
//

import UIKit

struct CollectionTableViewCellViewModel4 {
    let viewModels: [TitleCollectionViewCellViewModel4]
}

protocol CollectionTableViewCellDelegate4: AnyObject {
    func collectionTableViewCellDidTapItem(with viewModel4: TitleCollectionViewCellViewModel4)
}

class CollectionTableViewCell4: UITableViewCell , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    static let identifier = "CollectionTableViewCell4"
    
    weak var delegate: CollectionTableViewCellDelegate4?
    
    private var viewModels4: [TitleCollectionViewCellViewModel4] = []
    
    private let collectionView: UICollectionView

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.register(TitleCollectionViewCell4.self, forCellWithReuseIdentifier: TitleCollectionViewCell4.identifier)
        self.collectionView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.collectionView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    //MARK: CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels4.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell4.identifier, for: indexPath) as? TitleCollectionViewCell4 else {
            fatalError()
        }
        cell.configure(with: viewModels4[indexPath.row])
        return cell
    }
    
    
    
    func configure(with viewModel: CollectionTableViewCellViewModel4){
        self.viewModels4 = viewModel.viewModels
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = contentView.frame.size.width/2.5
        return CGSize(width: width, height: width/1.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let viewModel = viewModels4[indexPath.row]
        delegate?.collectionTableViewCellDidTapItem(with: viewModel)
    }
}


