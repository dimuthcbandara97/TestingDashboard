//
//  UIView.swift
//  TestingDashboard
//
//  Created by Dimuth Bandara on 2023-03-13.
//

import UIKit

import UIKit

extension UIView {
    
    // Add Bottom Border (Function)
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0,
                                 y: frame.height - height,
                                 width: frame.width,
                                 height: height)
        addSubview(separator)
    }
    
    // Configuration of buttons
    
    func makeSystem(_ button: UIButton) {
        
        
        button.addTarget(self, action: #selector(handlineIn), for: [
            .touchDown,
            .touchUpInside
        ])
        
        button.addTarget(self, action: #selector(handlineOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
   
    // In function
    @objc func handlineIn() {
        UIView.animate(withDuration: 0.15) {self.alpha = 0.55}
    }
    
    // Out function
    @objc func handlineOut() {
        UIView.animate(withDuration: 0.15) {self.alpha = 1}
    }
    
    func  setupView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
