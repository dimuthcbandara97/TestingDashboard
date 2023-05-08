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
    static let API_KEY_STATS = "https://nodemongocrud.onrender.com/api/stats"
    static let API_KEY_USER_DETAILS = "https://nodemongocrud.onrender.com/api/stats"
    
    // Testing Image View
//    static let API_KEY = "faa8695dc581ea2088374b01596042e2"
//    static let baseURL = "https://api.themoviedb.org"
    
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
//    func insertUser(userr: UserElement, completionHandler: @escaping (Bool, Error?) -> Void) {
//        let url = URL(string: Constants.API_KEY_USERS)!
//        print(url)
//        var request = URLRequest(url: url)
//        print(request)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        print(request)
//        let encoder = JSONEncoder()
//        print(encoder)
//        do {
//            let jsonData = try encoder.encode(userr)
//            print(jsonData)
//            request.httpBody = jsonData
//        } catch {
//            print(error.localizedDescription)
//            completionHandler(false, error)
//            return
//        }
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//                completionHandler(false, error)
//                return
//            }
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200...299).contains(httpResponse.statusCode) else {
//                print("API error")
//                completionHandler(false, nil)
//                return
//            }
//            // Call the completion handler with success as true
//            completionHandler(true, nil)
//        }
//        task.resume()
//    }

    func insertUser(userr: UserElement, completionHandler: @escaping (Bool, Error?) -> Void) {
        let url = URL(string: Constants.API_KEY_USERS)!
        print(url)
        var request = URLRequest(url: url)
        print(request)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        print(request)

        let parameters = "name=\(userr.name)&email=\(userr.email)&phone=\(userr.email)" // create the parameters string using the data in the UserElement

        request.httpBody = parameters.data(using: .utf8) // set the httpBody of the request

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completionHandler(false, error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("API error")
                completionHandler(false, nil)
                return
            }
            // Call the completion handler with success as true
            completionHandler(true, nil)
        }
        task.resume()
    }

    
    func loadUserDetails(completion: @escaping ([UserDetailssElement]) -> Void){
           
        guard let url = URL(string: Constants.API_KEY_USER_DETAILS) else {return}
            
        let task = URLSession.shared.dataTask(with: URLRequest(url: url,timeoutInterval: 30)){ data, _, error in
                
            guard let data = data, error == nil else {
                return
            }
                
            do {
                let results = try JSONDecoder().decode([UserDetailssElement].self, from: data)
                completion(results) // passing the results to the completion handler
            } catch {
                print(error.localizedDescription)
            }
                
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
                completion([])
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

    func insertProgress(user: ProgressElement, completionHandler: @escaping (Bool, Error?) -> Void) {
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
            completionHandler(false, error)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completionHandler(false, error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("API error")
                completionHandler(false, nil)
                return
            }
            // Call the completion handler with success as true
            completionHandler(true, nil)
        }
        task.resume()
    }
        
    
    func loadStats(completion: @escaping ([StatssElement]) -> Void){
           
        guard let url = URL(string: Constants.API_KEY_STATS) else {return}
            
        let task = URLSession.shared.dataTask(with: URLRequest(url: url,timeoutInterval: 30)){ data, _, error in
                
            guard let data = data, error == nil else {
                return
            }
                
            do {
                let results = try JSONDecoder().decode([StatssElement].self, from: data)
                completion(results) // passing the results to the completion handler
            } catch {
                print(error.localizedDescription)
            }
                
        }
        task.resume()
    }

}



