//
//  ViewController.swift
//  HipoApp
//
//  Created by ACS on 21.04.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var header: UILabel = UILabel()
    private lazy var tableView: MemberTableView = MemberTableView()
    private lazy var addButton: CustomButton = CustomButton()
    private lazy var sortButton: CustomButton = CustomButton()
    
    private var database: Database = Database()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: kColor_MainBackgroundColor)
        
        //TableView
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        //Header Text
        self.view.addSubview(header)
        header.font = header.font.withSize(16)
        header.backgroundColor = .white
        header.text = kTitle_members

        //Add Button
        self.view.addSubview(addButton)
        addButton.configureWith(title: kTitle_addNewMember)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        //Sort Button
        self.view.addSubview(sortButton)
        sortButton.configureWith(title: kTitle_sortMembers)
        
        configureConstraints()

    }
    
    @objc private func addButtonTapped() {
        database.addMember()
        tableView.reloadData()
    }
    
    private func configureConstraints() {
        sortButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(addButton.snp.top).inset(-15)
        }
        
        addButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(45)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(header.snp.bottom).offset(30)
            make.left.right.bottom.equalToSuperview()
        }
        
        header.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(57)
        }
    }
}


// MARK: - TableView Functions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database.members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MemberTableViewCell
        cell.configureCell(member: database.members[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Tapped!")
//        print(tableView.rowHeight)
//    }
}

