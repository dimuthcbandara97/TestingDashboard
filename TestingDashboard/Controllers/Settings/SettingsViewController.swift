//
//  SettingsViewController.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit
import MusicKit

enum Sections2: Int {
    case sectionss01 = 0
    case sectionss02 = 1
    case sectionss03 = 2
    case sectionss04 = 3
    case sectionss05 = 4
}

class SettingsBaseController: BaseController{
  

    let sectionTitles: [String] = ["Nutritious Foods","Meditations"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Health"
    }
    

}
