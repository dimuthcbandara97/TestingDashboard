//
//  SensorReadingsController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-05-20.
//


import UIKit
import HealthKit

class SensorReadingsController: UIViewController {
    
    let healthStore = HKHealthStore()
    
    private var stepCountTextField: UITextField!
    private var heartRateTextField: UITextField!
    private var bloodPressureTextField: UITextField!
    private var temperatureTextField: UITextField!
    private var addButton: UIButton!
    private var stepCountLabel: UILabel!
    private var heartRateLabel: UILabel!
    private var bloodPressureLabel: UILabel!
    private var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Disply Health Data
        
        view.backgroundColor = .white
        
        // Create step count text field
//        stepCountTextField = createTextField(frame: CGRect(x: 60, y: 100, width: view.bounds.width - 120, height: 40), placeholder: "Enter Step Count")
//        view.addSubview(stepCountTextField)

        
        // Create heart rate text field
        heartRateTextField = createTextField(frame: CGRect(x: 60, y: 160, width: view.bounds.width - 120, height: 40), placeholder: "Enter Heart Rate")
        heartRateTextField.layer.borderWidth = 1.0
        heartRateTextField.layer.borderColor = UIColor.lightGray.cgColor
        heartRateTextField.layer.cornerRadius = 5.0
        view.addSubview(heartRateTextField)
        
        // Create blood pressure text field
        bloodPressureTextField = createTextField(frame: CGRect(x: 60, y: 220, width: view.bounds.width - 120, height: 40), placeholder: "Enter Blood Pressure")
        bloodPressureTextField.layer.borderWidth = 1.0
        bloodPressureTextField.layer.borderColor = UIColor.lightGray.cgColor
        bloodPressureTextField.layer.cornerRadius = 5.0
        view.addSubview(bloodPressureTextField)
        
        
        // Create temperature text field
        temperatureTextField = createTextField(frame: CGRect(x: 60, y: 280, width: view.bounds.width - 120, height: 40), placeholder: "Enter Temperature")
        temperatureTextField.layer.borderWidth = 1.0
        temperatureTextField.layer.borderColor = UIColor.lightGray.cgColor
        temperatureTextField.layer.cornerRadius = 5.0
        view.addSubview(temperatureTextField)
        
        
        // Create add button
        addButton = UIButton(type: .system)
        addButton.frame = CGRect(x: 20, y: 340, width: view.bounds.width - 40, height: 40)
        addButton.setTitle("Add Readings", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        view.addSubview(addButton)
        
        // Create step count label
//        stepCountLabel = createLabel(frame: CGRect(x: 20, y: 400, width: view.bounds.width - 40, height: 40))
//        view.addSubview(stepCountLabel)

        // Create heart rate label
        heartRateLabel = createLabel(frame: CGRect(x: 20, y: 460, width: view.bounds.width - 40, height: 40))
        view.addSubview(heartRateLabel)
        
        // Create blood pressure label
        bloodPressureLabel = createLabel(frame: CGRect(x: 20, y: 520, width: view.bounds.width - 40, height: 40))
        view.addSubview(bloodPressureLabel)
        
        // Create temperature label
        temperatureLabel = createLabel(frame: CGRect(x: 20, y: 580, width: view.bounds.width - 40, height: 40))
        view.addSubview(temperatureLabel)
        
        // Check if HealthKit is available on the device
        guard HKHealthStore.isHealthDataAvailable() else {
            print("HealthKit is not available on this device.")
            return
        }
        
        // MARK: Request authorization to read and write health data
        let stepCountType = HKObjectType.quantityType(forIdentifier: .stepCount)!
        let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!
        let bloodPressureSystolicType = HKObjectType.quantityType(forIdentifier: .bloodPressureSystolic)!
        let bloodPressureDiastolicType = HKObjectType.quantityType(forIdentifier: .bloodPressureDiastolic)!
        let temperatureType = HKObjectType.quantityType(forIdentifier: .bodyTemperature)!
        
        let typesToShare: Set<HKSampleType> = [stepCountType, heartRateType, bloodPressureSystolicType, bloodPressureDiastolicType, temperatureType]
        let typesToRead: Set<HKObjectType> = [stepCountType, heartRateType, bloodPressureSystolicType, bloodPressureDiastolicType, temperatureType]
        
        
        // MARK: Request Authorization
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            if let error = error {
                print("Failed to request authorization: \(error.localizedDescription)")
                return
            }
            
            if success {
                DispatchQueue.main.async {
                    self.showSuccessMessage()
                }
            } else {
                print("Authorization denied.")
            }
        }
        displayHealthData()
    }
    
    // MARK: ADD Button Tapped ?
    @objc func addButtonTapped() {
        
//        guard let stepCountText = stepCountTextField.text, let stepCount = Double(stepCountText),
            guard  let heartRateText = heartRateTextField.text, let heartRate = Double(heartRateText),
              let bloodPressureSystolicText = bloodPressureTextField.text, let bloodPressureSystolic = Double(bloodPressureSystolicText),
              let bloodPressureDiastolicText = bloodPressureTextField.text, let bloodPressureDiastolic = Double(bloodPressureDiastolicText),
              let temperatureText = temperatureTextField.text, let temperature = Double(temperatureText) else {
            print("Invalid input.")
            return
        }
        
        // MARK: Step Count Samples
        let stepCountUnit = HKUnit.count()
        let heartRateUnit = HKUnit.count().unitDivided(by: .minute())
        let bloodPressureUnit = HKUnit.millimeterOfMercury()
        let temperatureUnit = HKUnit.degreeCelsius()
        
        // MARK: Samples
        
        // Step Count Samples
//        let stepCountSample = HKQuantitySample(type: HKObjectType.quantityType(forIdentifier: .stepCount)!, quantity: HKQuantity(unit: stepCountUnit, doubleValue: stepCount), start: Date(), end: Date())
        
        // Heart Rate Samples
        let heartRateSample = HKQuantitySample(type: HKObjectType.quantityType(forIdentifier: .heartRate)!, quantity: HKQuantity(unit: heartRateUnit, doubleValue: heartRate), start: Date(), end: Date())
        
        // Blood Pressure Systolic Sample
        let bloodPressureSystolicSample = HKQuantitySample(type: HKObjectType.quantityType(forIdentifier: .bloodPressureSystolic)!, quantity: HKQuantity(unit: bloodPressureUnit, doubleValue: bloodPressureSystolic), start: Date(), end: Date())
        
        // Blood Pressure Diastolic Sample
        let bloodPressureDiastolicSample = HKQuantitySample(type: HKObjectType.quantityType(forIdentifier: .bloodPressureDiastolic)!, quantity: HKQuantity(unit: bloodPressureUnit, doubleValue: bloodPressureDiastolic), start: Date(), end: Date())
        
        // Temperature Sample
        let temperatureSample = HKQuantitySample(type: HKObjectType.quantityType(forIdentifier: .bodyTemperature)!, quantity: HKQuantity(unit: temperatureUnit, doubleValue: temperature), start: Date(), end: Date())
        
        
        let samples: [HKSample] = [heartRateSample, bloodPressureSystolicSample, bloodPressureDiastolicSample, temperatureSample]
        
        // MARK: Save the health data samples to HealthKit
        healthStore.save(samples) { (success, error) in
            if let error = error {
                print("Failed to save health data samples: \(error.localizedDescription)")
                return
            }
            
            if success {
                DispatchQueue.main.async {
//                    self.stepCountLabel.text = "Step Count: \(stepCount)"
                    self.heartRateLabel.text = "Heart Rate: \(heartRate)"
                    self.bloodPressureLabel.text = "Blood Pressure: \(bloodPressureSystolic)/\(bloodPressureDiastolic)"
                    self.temperatureLabel.text = "Temperature: \(temperature)"
                }
            } else {
                print("Failed to save health data samples.")
            }
        }
    }
    
    // TF
    func createTextField(frame: CGRect, placeholder: String) -> UITextField {
        let textField = UITextField(frame: frame)
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        return textField
    }
    
    // Lbl
    func createLabel(frame: CGRect) -> UILabel {
        let label = UILabel(frame: frame)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }
    
    // MARK: Success Message (Alert)
    func showSuccessMessage() {
        let alertController = UIAlertController(title: "Authorization Granted", message: "You have been granted access to HealthKit data.", preferredStyle: .alert)
        
        // Customize the alert title font and color
        let attributedTitle = NSAttributedString(string: "Authorization Granted", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.blue
        ])
        alertController.setValue(attributedTitle, forKey: "attributedTitle")
        
        // Customize the alert message font and color
        let attributedMessage = NSAttributedString(string: "You have been granted access to HealthKit data.", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ])
        alertController.setValue(attributedMessage, forKey: "attributedMessage")
        
        // Customize the alert background color
        if let backgroundView = alertController.view.subviews.first,
           let contentView = backgroundView.subviews.first {
            contentView.backgroundColor = UIColor.white
            contentView.layer.cornerRadius = 10
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: Display Health Data
    func displayHealthData() {
        let typesToRead: Set<HKObjectType> = [
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.quantityType(forIdentifier: .bloodPressureSystolic)!,
            HKObjectType.quantityType(forIdentifier: .bloodPressureDiastolic)!,
            HKObjectType.quantityType(forIdentifier: .bodyTemperature)!
        ]
        
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
            if let error = error {
                print("Failed to request authorization: \(error.localizedDescription)")
                return
            }
            
            if success {
                
                // MARK: Step Count
                let queryStepCount = HKSampleQuery(sampleType: HKObjectType.quantityType(forIdentifier: .stepCount)!, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, results, error) in
                    guard let samples = results as? [HKQuantitySample], let sample = samples.first else {
                        print("Failed to fetch step count data: \(error?.localizedDescription ?? "")")
                        return
                    }
                    let stepCount = sample.quantity.doubleValue(for: HKUnit.count())
//                    DispatchQueue.main.async {
//                        self.stepCountLabel.text = "Step Count: \(stepCount)"
//                    }
                }
                
                // MARK: Heart Rate
                let queryHeartRate = HKSampleQuery(sampleType: HKObjectType.quantityType(forIdentifier: .heartRate)!, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, results, error) in
                    guard let samples = results as? [HKQuantitySample], let sample = samples.first else {
                        print("Failed to fetch heart rate data: \(error?.localizedDescription ?? "")")
                        return
                    }
                    let heartRate = sample.quantity.doubleValue(for: HKUnit.count().unitDivided(by: .minute()))
                    DispatchQueue.main.async {
                        self.heartRateLabel.text = "Heart Rate: \(heartRate)"
                    }
                }
                
                // MARK: Blood Pressure
                let queryBloodPressure = HKSampleQuery(sampleType: HKObjectType.quantityType(forIdentifier: .bloodPressureSystolic)!, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, results, error) in
                    guard let samples = results as? [HKQuantitySample], let sample = samples.first else {
                        print("Failed to fetch blood pressure data: \(error?.localizedDescription ?? "")")
                        return
                    }
                    let systolic = sample.quantity.doubleValue(for: HKUnit.millimeterOfMercury())
                    let diastolic = sample.quantity.doubleValue(for: HKUnit.millimeterOfMercury())
                    DispatchQueue.main.async {
                        self.bloodPressureLabel.text = "Blood Pressure: \(systolic)/\(diastolic)"
                    }
                }
                
                // MARK: Temperature
                let queryTemperature = HKSampleQuery(sampleType: HKObjectType.quantityType(forIdentifier: .bodyTemperature)!, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, results, error) in
                    guard let samples = results as? [HKQuantitySample], let sample = samples.first else {
                        print("Failed to fetch temperature data: \(error?.localizedDescription ?? "")")
                        return
                    }
                    let temperature = sample.quantity.doubleValue(for: HKUnit.degreeCelsius())
                    DispatchQueue.main.async {
                        self.temperatureLabel.text = "Temperature: \(temperature)"
                    }
                }
                
                self.healthStore.execute(queryStepCount)
                self.healthStore.execute(queryHeartRate)
                self.healthStore.execute(queryBloodPressure)
                self.healthStore.execute(queryTemperature)
            }
        }
    }
    
    
}
