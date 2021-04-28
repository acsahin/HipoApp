//
//  CustomButton.swift
//  HipoApp
//
//  Created by ACS on 21.04.2021.
//

import UIKit

class CustomButton: UIButton {

    func configureWith(title: String, backColor: UIColor) {
        
        layer.cornerRadius = CGFloat(25)
        setTitle(title, for: .normal)
        tintColor = .white
        titleLabel?.font = UIFont(name: "Avenir-Light", size: 12)
        backgroundColor = backColor
    }
    
}
