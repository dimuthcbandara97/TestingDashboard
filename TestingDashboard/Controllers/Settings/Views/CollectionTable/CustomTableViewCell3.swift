//
//  CustomTableViewCell3.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-30.
//

import UIKit

struct CollectionTableViewCellViewModel3 {
    let viewModels: [TitleCollectionViewCellViewModel3]
}

protocol CollectionTableViewCellDelegate3: AnyObject {
    func collectionTableViewCellDidTapItem(with viewModel3: TitleCollectionViewCellViewModel3)
}

class CollectionTableViewCell3: UITableViewCell , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    static let identifier = "CollectionTableViewCell3"
    
    weak var delegate: CollectionTableViewCellDelegate3?
    
    private var viewModels3: [TitleCollectionViewCellViewModel3] = []
    
    private let collectionView: UICollectionView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.register(TitleCollectionViewCell3.self, forCellWithReuseIdentifier: TitleCollectionViewCell3.identifier)
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
        return viewModels3.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell3.identifier, for: indexPath) as? TitleCollectionViewCell3 else {
            fatalError()
        }
        cell.configure(with: viewModels3[indexPath.row])
        return cell
    }
    
    // MARK: Configure
    func configure(with viewModel: CollectionTableViewCellViewModel3){
        self.viewModels3 = viewModel.viewModels
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = contentView.frame.size.width/2.5
        return CGSize(width: width, height: width/1.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let viewModel = viewModels3[indexPath.row]
        delegate?.collectionTableViewCellDidTapItem(with: viewModel)
    }
}


