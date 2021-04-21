//
//  CustomButton.swift
//  HipoApp
//
//  Created by ACS on 21.04.2021.
//

import UIKit
import SnapKit

class CustomButton: UIButton {

    func configureWith(title: String) {
        
        layer.cornerRadius = CGFloat(25)
        snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(285)
            make.height.equalTo(50)
        }
        
        setTitle(title, for: .normal)
        tintColor = .white
        titleLabel?.font = UIFont(name: "Avenir-Light", size: 12)
        
        if title == kTitle_sortMembers {
            backgroundColor = UIColor(named: kColor_SortButtonColor)
        }else if title == kTitle_addNewMember {
            backgroundColor = UIColor(named: kColor_AddButtonColor)
        }
    }
    
}
