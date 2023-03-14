//
//  APIAuth.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//


import Foundation

struct Constants {
    static let API_KEY = "https://nodemongocrud.onrender.com/api/users"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func loadExercise(completion: @escaping ([ExerciseElement]) -> Void){
           
        guard let url = URL(string: Constants.API_KEY) else {return}
            
        let task = URLSession.shared.dataTask(with: URLRequest(url: url,timeoutInterval: 30)){ data, _, error in
                
            guard let data = data, error == nil else {
                return
            }
                
            do {
                let results = try JSONDecoder().decode([ExerciseElement].self, from: data)
                completion(results) // passing the results to the completion handler
            } catch {
                print(error.localizedDescription)
            }
                
        }
        task.resume()
    }

}

