//
//  APIAuth.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//


import Foundation

struct Constants {
    static let API_KEY_USERS = "https://nodemongocrud.onrender.com/api/users"
    static let API_KEY_EXERCISE = "https://nodemongocrud.onrender.com/api/exercise"
    static let API_KEY_MEDITATION = "https://nodemongocrud.onrender.com/api/meditation"
    static let API_KEY_NETWORKING = "https://nodemongocrud.onrender.com/api/networking"
    static let API_KEY_NUTRITION = "https://nodemongocrud.onrender.com/api/nutrition"
    static let API_KEY_TIMER = "https://nodemongocrud.onrender.com/api/timer"
    static let API_KEY_PROGRESS = "https://nodemongocrud.onrender.com/api/progress"
    
    // Testing Image View
    static let API_KEY = "faa8695dc581ea2088374b01596042e2"
    static let baseURL = "https://api.themoviedb.org"
    
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    
    static let shared = APICaller()
    
    // CRUD Users -> Read
    func loadUsers(completion: @escaping ([UserElement]) -> Void){
           
        guard let url = URL(string: Constants.API_KEY_USERS) else {return}
            
        let task = URLSession.shared.dataTask(with: URLRequest(url: url,timeoutInterval: 30)){ data, _, error in
                
            guard let data = data, error == nil else {
                return
            }
                
            do {
                let results = try JSONDecoder().decode([UserElement].self, from: data)
                completion(results) // passing the results to the completion handler
            } catch {
                print(error.localizedDescription)
            }
                
        }
        task.resume()
    }
    
    // CRUD users - insert
    func insertUser(user: UserElement) {
        let url = URL(string: Constants.API_KEY_USERS)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(user)
            request.httpBody = jsonData
        } catch {
            print(error.localizedDescription)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("API error")
                return
            }
            // Update UI with new data
        }
        task.resume()
    }



    // CRUD Exercise -> Read
    func loadExercise(completion: @escaping ([ExerciseElement]) -> Void){
           
        guard let url = URL(string: Constants.API_KEY_EXERCISE) else {return}
            
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
    
    // CRUD Meditation -> Read
    func loadMeditation(completion: @escaping ([MeditationElement]) -> Void){
           
        guard let url = URL(string: Constants.API_KEY_MEDITATION) else {return}
            
        let task = URLSession.shared.dataTask(with: URLRequest(url: url,timeoutInterval: 30)){ data, _, error in
                
            guard let data = data, error == nil else {
                return
            }
                
            do {
                let results = try JSONDecoder().decode([MeditationElement].self, from: data)
                completion(results) // passing the results to the completion handler
            } catch {
                print(error.localizedDescription)
            }
                
        }
        task.resume()
    }
    
    // CRUD Networking -> Read
    func loadNetworking(completion: @escaping ([NetworkingElement]) -> Void){
           
        guard let url = URL(string: Constants.API_KEY_NETWORKING) else {return}
            
        let task = URLSession.shared.dataTask(with: URLRequest(url: url,timeoutInterval: 30)){ data, _, error in
                
            guard let data = data, error == nil else {
                return
            }
                
            do {
                let results = try JSONDecoder().decode([NetworkingElement].self, from: data)
                completion(results) // passing the results to the completion handler
            } catch {
                print(error.localizedDescription)
            }
                
        }
        task.resume()
    }
    
    // CRUD Nutrition -> Read
    func loadNutrition(completion: @escaping ([NutritionElement]) -> Void){
           
        guard let url = URL(string: Constants.API_KEY_NUTRITION) else {return}
            
        let task = URLSession.shared.dataTask(with: URLRequest(url: url,timeoutInterval: 30)){ data, _, error in
                
            guard let data = data, error == nil else {
                return
            }
                
            do {
                let results = try JSONDecoder().decode([NutritionElement].self, from: data)
                completion(results) // passing the results to the completion handler
            } catch {
                print(error.localizedDescription)
            }
                
        }
        task.resume()
    }
    
    // CRUD Progress - Read
    func loadProgress(completion: @escaping ([ProgressElement]) -> Void){
           
        guard let url = URL(string: Constants.API_KEY_PROGRESS) else {return}
            
        let task = URLSession.shared.dataTask(with: URLRequest(url: url,timeoutInterval: 30)){ data, _, error in
                
            guard let data = data, error == nil else {
                return
            }
                
            do {
                let results = try JSONDecoder().decode([ProgressElement].self, from: data)
                completion(results) // passing the results to the completion handler
            } catch {
                print(error.localizedDescription)
            }
                
        }
        task.resume()
    }
    
    // CRUDProgress - Insert

    func insertProgress(user: ProgressElement) {
        let url = URL(string: Constants.API_KEY_PROGRESS)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(user)
            request.httpBody = jsonData
        } catch {
            print(error.localizedDescription)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("API error")
                return
            }
            // Update UI with new data
        }
        task.resume()
    }
    
    // CRUD Timer -> Read
    func loadTimer(completion: @escaping ([TimerElement]) -> Void){
           
        guard let url = URL(string: Constants.API_KEY_TIMER) else {return}
            
        let task = URLSession.shared.dataTask(with: URLRequest(url: url,timeoutInterval: 30)){ data, _, error in
                
            guard let data = data, error == nil else {
                return
            }
                
            do {
                let results = try JSONDecoder().decode([TimerElement].self, from: data)
                completion(results) // passing the results to the completion handler
            } catch {
                print(error.localizedDescription)
            }
                
        }
        task.resume()
    }
    
   // Testing Image View
    func gettrendingMoview(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else { return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //                print(results)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                //                print(results.results[0].original_title)
            } catch {
                //                print(error.localizedDescription)
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    

}

