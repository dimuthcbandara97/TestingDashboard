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
    
   
    
    
    

}

