//
//  CollectionViewTableViewCellNutrition.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-29.
//

import Foundation
import UIKit

class CollectionViewTableViewCellNutrition: UITableViewCell {

    static let identifier = "CollectionViewTableViewCellExercise"
    
    private var nutritions: [NutritionElement] = [NutritionElement]()

    private let collectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NutritionCollectionViewCell.self, forCellWithReuseIdentifier: NutritionCollectionViewCell.identifer)
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
    }


    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with nutritions: [NutritionElement]){
        self.nutritions = nutritions
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
}


extension CollectionViewTableViewCellNutrition: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NutritionCollectionViewCell.identifer, for: indexPath) as? NutritionCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard nutritions[indexPath.row].imageurl != nil else {
            return UICollectionViewCell()
        }
        

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nutritions.count
    }

}
