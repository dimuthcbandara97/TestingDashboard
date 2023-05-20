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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Check if HealthKit is available on the device
        guard HKHealthStore.isHealthDataAvailable() else {
            // Handle the case when HealthKit is not available on the device
            return
        }

        // Request authorization from the user to access step count data (read access only)
        let stepCountType = HKObjectType.quantityType(forIdentifier: .stepCount)!
        healthStore.requestAuthorization(toShare: nil, read: [stepCountType]) { (success, error) in
            if success {
                // Authorization granted, you can now fetch step count data
                self.fetchStepCount()
            } else {
                // Authorization denied or an error occurred
                // Handle the error appropriately
            }
        }
    }

    func fetchStepCount() {
        // Define the step count query
        let stepCountType = HKObjectType.quantityType(forIdentifier: .stepCount)!
        let query = HKStatisticsQuery(quantityType: stepCountType, quantitySamplePredicate: nil, options: .cumulativeSum) { (query, result, error) in
            guard let result = result, let sum = result.sumQuantity() else {
                // Handle the case when the query fails or no data is available
                return
            }

            let stepCount = sum.doubleValue(for: HKUnit.count())
            // Use the step count value as needed (e.g., display it to the user)
            print("Step count: \(stepCount)")
        }

        // Execute the query
        healthStore.execute(query)
    }
}

