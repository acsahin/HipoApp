//
//  ViewController.swift
//  HipoApp
//
//  Created by ACS on 21.04.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var header = UILabel()
    private lazy var tableView = MemberTableView()
    private lazy var addButton = CustomButton()
    private lazy var sortButton = CustomButton()
    
    private var database = Database()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: kColor_MainBackgroundColor)
        
        //TableView
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        database.loadMembers {
            self.tableView.reloadData()
            self.addButton.isHidden = false
            self.sortButton.isHidden = false
        }
        
        //Header Text
        self.view.addSubview(header)
        header.font = header.font.withSize(16)
        header.backgroundColor = .white
        header.text = kTitle_members

        //Add Button
        self.view.addSubview(addButton)
        addButton.configureWith(title: kTitle_addNewMember, backColor: UIColor(named: kColor_AddButtonColor)!)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.isHidden = true
        
        //Sort Button
        self.view.addSubview(sortButton)
        sortButton.configureWith(title: kTitle_sortMembers, backColor: UIColor(named: kColor_SortButtonColor)!)
        sortButton.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
        sortButton.isHidden = true
        
        configureConstraints()
    }
    
    @objc private func addButtonTapped() {
        database.addMember()
        tableView.reloadData()
    }
    
    @objc private func sortButtonTapped() {
        sorting(elements: database.getLastNames(), char: "a")
    }
    
    private func configureConstraints() {
        sortButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(285)
            make.height.equalTo(50)
            make.bottom.equalTo(addButton.snp.top).inset(-15)
        }
        
        addButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(285)
            make.height.equalTo(50)
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
    
    
    //
    // THE SORTING ALGORITHM
    //
    private func sorting(elements: [String], char: String) {
        var lastNames = elements
        lastNames.sort { (first, second) -> Bool in
            
            
            // STEP-1: Sort descending order with the amount of the char in strings
            if first.numberOfOccurences(char: char) > second.numberOfOccurences(char: char) {
                return true
            } else if first.numberOfOccurences(char: char) < second.numberOfOccurences(char: char) {
                return false
                
                
                // STEP-2: If they contain same amount of the char, sort with their lengths
            } else {
                if first.count > second.count {
                    return true
                } else if first.count < second.count {
                    return false
                    
                    
                    // STEP-3: If they have same amount of the char and have same length, sort them alphabetically
                } else {
                    return first.localizedCaseInsensitiveCompare(second) == .orderedAscending
                }
            }
        }
        
        
        // Reorder members list and reload table view
        database.reorderBy(lastNames)
        tableView.reloadData()
    }
}




// MARK: - TableView Functions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database.members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kIdentifier_CellIdentifier, for: indexPath) as! MemberTableViewCell
        cell.prepareForReuse()
        cell.configureCell(member: database.members[indexPath.row])
        
        return cell
    }
    
    func reloader() {
        self.tableView.reloadData()
    }
    
}



// MARK: - Find Number of Occurences
extension String {
    func numberOfOccurences(char: String) -> Int {
        return self.lowercased().components(separatedBy: char.lowercased()).count-1
    }
}
