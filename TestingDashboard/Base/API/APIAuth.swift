//
//  APIAuth.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//


import Foundation

struct Constants {
    // 
    static let API_KEY_USERS = "https://nodemongocrud.onrender.com/api/users"
    static let API_KEY_EXERCISE = "https://nodemongocrud.onrender.com/api/exercise"
    static let API_KEY_MEDITATION = "https://nodemongocrud.onrender.com/api/meditation"
    static let API_KEY_NETWORKING = "https://nodemongocrud.onrender.com/api/networking"
    static let API_KEY_NUTRITION = "https://nodemongocrud.onrender.com/api/nutrition"
    static let API_KEY_TIMER = "https://nodemongocrud.onrender.com/api/timer"
    static let API_KEY_PROGRESS = "https://nodemongocrud.onrender.com/api/progress"
    static let API_KEY_STATS = "https://nodemongocrud.onrender.com/api/stats"
    static let API_KEY_USER_DETAILS = "https://nodemongocrud.onrender.com/api/user_details"
    static let API_KEY_FAVOURITES = "https://nodemongocrud.onrender.com/api/favourites"
    
    // Testing Image View
//    static let API_KEY = "faa8695dc581ea2088374b01596042e2"
//    static let baseURL = "https://api.themoviedb.org"
    
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    
    static let shared = APICaller()
    
    // MARK: Load Users
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
    
    // MARK: Insert Users
    func insertUser(userr: UserElement, completionHandler: @escaping (Bool, Error?) -> Void) {
        let url = URL(string: Constants.API_KEY_USERS)!
        print(url)
        var request = URLRequest(url: url)
        print(request)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        print(request)

        let parameters = "name=\(userr.name)&password=\(userr.password)&email=\(userr.email)&gender=\(userr.gender)&imageurl=\(userr.imageurl)" // create the parameters string using the data in the UserElement

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

    // MARK: Filter Exercises Based on BMI
    func filterExercisesByBMIRange(bmiRange: String, completion: @escaping (Exercise) -> Void) {
        guard let url = URL(string: Constants.API_KEY_EXERCISE) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url, timeoutInterval: 30)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let exercises = try JSONDecoder().decode(Exercise.self, from: data)
                let filteredExercises = exercises.filter { $0.bmiRange == bmiRange }
                completion(filteredExercises)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // MARK: Load User Details
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
    
    // MARK: Insert User Details
    func insertUserDetails(userr: UserDetailssElement, completionHandler: @escaping (Bool, Error?) -> Void) {
        let url = URL(string: Constants.API_KEY_USER_DETAILS)!
        print(url)
        var request = URLRequest(url: url)
        print(request)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        print(request)

        let parameters = "status=\(userr.status)&height=\(userr.height)&weight=\(userr.weight)&age=\(userr.age)&fitness_goal=\(userr.fitnessGoal)&email=\(userr.email)" // create the parameters string using the data in the UserElement

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
    
    // MARK: Update By User Email
    func updateByEmailUser(email: String, updatedUserDetails: UserDetailssElement, completionHandler: @escaping (Bool, Error?) -> Void) {
        let url = URL(string: Constants.API_KEY_USER_DETAILS)!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        let parameters = "email=\(email)&status=\(updatedUserDetails.status)&height=\(updatedUserDetails.height)&weight=\(updatedUserDetails.weight)&age=\(updatedUserDetails.age)&fitness_goal=\(updatedUserDetails.fitnessGoal)"

        request.httpBody = parameters.data(using: .utf8)

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
            completionHandler(true, nil)
        }

        task.resume()
    }
    
    // MARK: Load Exercises
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
    
    // MARK: Insert Exercises
    func insertExercise(exerr: ExerciseElement, completionHandler: @escaping (Bool, Error?) -> Void) {
        let url = URL(string: Constants.API_KEY_EXERCISE)!
        print(url)
        var request = URLRequest(url: url)
        print(request)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        print(request)

        let parameters = "exercise_name=\(exerr.exerciseName)&exercise_type=\(exerr.exerciseType)&instructor=\(exerr.instructor)&notes=\(exerr.notes)&imageurl=\(exerr.imageurl)&videourl=\(exerr.videourl)&affecting_area=\(exerr.affectingArea)&bmi_range=\(exerr.bmiRange)&exercise_time=\(exerr.exerciseTime)&tep_count=\(exerr.repCount)" // create the parameters string using the data in the UserElement

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
    
    // MARK: Update By Email -> Exercise
    func updateByEmailExercise(email: String, updatedExercise: ExerciseElement, completionHandler: @escaping (Bool, Error?) -> Void) {
        let url = URL(string: Constants.API_KEY_EXERCISE)!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        let parameters = "email=\(email)&exercise_name=\(updatedExercise.exerciseName)&exercise_type=\(updatedExercise.exerciseType)&instructor=\(updatedExercise.instructor)&notes=\(updatedExercise.notes)&imageurl=\(updatedExercise.imageurl)&videourl=\(updatedExercise.videourl)&affecting_area=\(updatedExercise.affectingArea)&bmi_range=\(updatedExercise.bmiRange)&exercise_time=\(updatedExercise.exerciseTime)&tep_count=\(updatedExercise.repCount)"

        request.httpBody = parameters.data(using: .utf8)

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
            completionHandler(true, nil)
        }

        task.resume()
    }

    
    // MARK: Load Meditation
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
    
    // MARK: Load Networking
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
    
    // MARK: Load Nurition
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
    
    // MARK: Load Progress
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
    
    // MARK: Insert Progress
    func insertProgress(progresss: ProgressElement, completionHandler: @escaping (Bool, Error?) -> Void) {
        let url = URL(string: Constants.API_KEY_PROGRESS)!
        print(url)
        var request = URLRequest(url: url)
        print(request)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        print(request)

        let parameters = "progress_name=\(progresss.progressName)&daily_count=\(progresss.dailyCount)&date=\(progresss.date)&month=\(progresss.month)" // create the parameters string using the data in the UserElement

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
        
    // MARK: Update By Progress Name
    func updateByProgressName(progressName: String, updatedProgress: ProgressElement, completionHandler: @escaping (Bool, Error?) -> Void) {
        let url = URL(string: Constants.API_KEY_PROGRESS)!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        let parameters = "progress_name=\(progressName)&daily_count=\(updatedProgress.dailyCount)&date=\(updatedProgress.date)&month=\(updatedProgress.month)"

        request.httpBody = parameters.data(using: .utf8)

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
            completionHandler(true, nil)
        }

        task.resume()
    }

    // MARK: Load Stats
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



