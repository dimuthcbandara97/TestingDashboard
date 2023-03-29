//
//  CollectionViewTableViewCellMeditation.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-29.
//

import Foundation
import UIKit

class CollectionViewTableViewCellMeditation: UITableViewCell {

    static let identifier = "CollectionViewTableViewCellExercise"
    
    private var meditations: [MeditationElement] = [MeditationElement]()

    private let collectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MeditationCollectionViewCell.self, forCellWithReuseIdentifier: MeditationCollectionViewCell.identifer)
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
    
    public func configure(with meditations: [MeditationElement]){
        self.meditations = meditations
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
}


extension CollectionViewTableViewCellMeditation: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MeditationCollectionViewCell.identifer, for: indexPath) as? MeditationCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard meditations[indexPath.row].imageurl != nil else {
            return UICollectionViewCell()
        }
        

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meditations.count
    }

}
