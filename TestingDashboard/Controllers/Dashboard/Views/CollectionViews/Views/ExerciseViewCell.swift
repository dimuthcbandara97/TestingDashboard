//
//  ExerciseViewCell.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-23.
//

import UIKit
import SwiftKeychainWrapper


class ExerciseViewCell: UITableViewCell {

    
    private let exerciseImageView: UIImageView = {
        let video = UIImageView()
//        video.contentMode = .scaleAspectFill
        video.clipsToBounds = false
        video.layer.cornerRadius = 4
        return video
    }()
    
    public let exerciseTitleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .systemPink
        title.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        title.numberOfLines = 2
        title.lineBreakMode = .byTruncatingTail
        return title
    }()
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(exerciseImageView)
        addSubview(exerciseTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstaints()
    }
    
    
    func set(exercise: ExerciseElement) {
        let keychain = KeychainWrapper.standard

        // Getter methods for retrieving values from the keychain
        

        if let userPassword = keychain.string(forKey: "UserPassword") {
            print("User Password Keychain: \(userPassword)")
        }

        if let userGender = keychain.string(forKey: "UserGender") {
            print("User Gender KeyChain : \(userGender)")
        }

        if let userImageURL = keychain.string(forKey: "UserImageURL") {
            print("User Image URLKC: \(userImageURL)")
        }

        if let userName = keychain.string(forKey: "UserName") {
            print("User Name KC: \(userName)")
        }
       
        if let userEmail = keychain.string(forKey: "UserEmail") {
            print("User Email Keychain: \(userEmail)")

            APICaller.shared.loadUserDetails { results in
                DispatchQueue.main.async {
                    if results.count > 0 {
                        let filteredResults = results.filter { $0.email == userEmail }
                        if filteredResults.count > 0 {
                            for user in filteredResults {
                                print(user.email)
                                print(user.weight)
                                print(user.fitnessGoal)
                                print(user.height)
                                print(user.status)
                            }
                        } else {
                            print("No results found for the user email: \(userEmail)")
                        }
                    } else {
                        print("No results found")
                    }
                }
            }
        } else {
            print("User email not found in Keychain")
            // Handle the error case appropriately
            // ...
        }
        
        let imageUrl = URL(string: exercise.imageurl)!
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    // Placeholder condition for filtering based on BMI
                    let shouldDisplayExercise = exercise.bmiRange == "Normal"
                    
                    if shouldDisplayExercise {
                        self.exerciseImageView.image = UIImage(data: imageData)
                        self.exerciseTitleLabel.text = exercise.exerciseName
                    }
                }
            }
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure Image
    func configureImageView(){
        exerciseImageView.layer.cornerRadius = 10
        exerciseImageView.clipsToBounds = true
    }
    
    // MARK: Configure Title
    func configureTitleLabel(){
        exerciseTitleLabel.numberOfLines = 0
        exerciseTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    // MARK: Image Constaints
    func setImageConstraints(){
        exerciseImageView.translatesAutoresizingMaskIntoConstraints = false
        exerciseImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        exerciseImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        exerciseImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        exerciseImageView.widthAnchor.constraint(equalTo: exerciseImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    // MARK: Label Constraints
    func setTitleLabelConstaints(){
        exerciseTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        exerciseTitleLabel.leadingAnchor.constraint(equalTo: exerciseImageView.trailingAnchor, constant: 20).isActive = true
        exerciseTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        exerciseTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}


