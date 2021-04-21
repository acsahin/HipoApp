//
//  MemberCell.swift
//  HipoApp
//
//  Created by ACS on 21.04.2021.
//

import UIKit
import SnapKit

class MemberTableViewCell: UITableViewCell {
    
    private lazy var containerView : UIView = {
        let container = UIView()
        container.backgroundColor = UIColor(named: kColor_TableCellBackgroundColor)
        container.layer.cornerRadius = 8
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor(named: kColor_TableCellBorderColor)?.cgColor
        container.layer.shadowColor = UIColor(named: kColor_TableCellShadowColor)?.cgColor
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowRadius = 2
        container.layer.shadowOpacity = 1
        container.layer.masksToBounds = false
        return container
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func configureCell(member: Member) {
        //Cell Subviews
        let nameLabel = UILabel()
        nameLabel.font = nameLabel.font.withSize(12)
        nameLabel.text = member.name
        nameLabel.textColor = .black
        
        let imgView = UIImageView(image: UIImage(systemName: "arrow.right"))
        imgView.tintColor = .black
        
        addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(imgView)

        containerView.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalToSuperview().offset(-30)
            make.centerX.centerY.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
        }
        imgView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
        }
        
        layer.masksToBounds = true
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
