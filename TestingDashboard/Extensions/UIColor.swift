//
//  UIColor.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit

extension UIColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        
        switch hex.count {
            
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,  // alpha
                            0xAA, // red
                            0x55, // green
                            0xFF) // blue
            
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,  // alpha
                            0x12, // red
                            0x34, // green
                            0x56) // blue
            
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24,           // alpha
                            int >> 16 & 0xFF,   // red
                            int >> 8 & 0xFF,    // green
                            int & 0xFF)         // blue
            
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255 * alpha)
    }
}

