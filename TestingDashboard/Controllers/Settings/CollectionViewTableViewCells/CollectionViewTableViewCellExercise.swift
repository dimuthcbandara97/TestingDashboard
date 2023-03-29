//
//  CollectionViewTableViewCellExercise.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-29.
//

import Foundation
import UIKit

class CollectionViewTableViewCellExercise: UITableViewCell {

    static let identifier = "CollectionViewTableViewCellExercise"
    
    private var exercises: [ExerciseElement] = [ExerciseElement]()

    private let collectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ExerciseCollectionViewCell.self, forCellWithReuseIdentifier: ExerciseCollectionViewCell.identifer)
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
    
    public func configure(with exercises: [ExerciseElement]){
        self.exercises = exercises
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
}


extension CollectionViewTableViewCellExercise: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCollectionViewCell.identifer, for: indexPath) as? ExerciseCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard exercises[indexPath.row].imageurl != nil else {
            return UICollectionViewCell()
        }
        

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exercises.count
    }

}
