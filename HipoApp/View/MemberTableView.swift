//
//  MemberTable.swift
//  HipoApp
//
//  Created by ACS on 21.04.2021.
//

import UIKit

class MemberTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = UIColor(named: kColor_MainBackgroundColor)
        separatorStyle = .none

        register(MemberTableViewCell.self, forCellReuseIdentifier: kIdentifier_CellIdentifier)

        rowHeight = 63
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
