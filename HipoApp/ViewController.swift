//
//  ViewController.swift
//  HipoApp
//
//  Created by ACS on 21.04.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var box = UIView()
    lazy var header = UILabel()
    lazy var tableView = UITableView()
    lazy var addButton = UIButton()
    lazy var sortButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(named: "MainBackgroundColor")
        
        self.view.addSubview(header)
        header.backgroundColor = .white
        header.textColor = .black
        header.text = "Header"
        header.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            //make.top.equalTo(UIApplication.shared.windows[0].safeAreaInsets.top)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        self.view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .yellow
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(header).offset(30)
            make.left.right.bottom.equalToSuperview()
        }
        
        self.view.addSubview(addButton)
        addButton.backgroundColor = .darkGray
        addButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(45)
        }

        self.view.addSubview(sortButton)
        sortButton.backgroundColor = .green
        sortButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(105)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.75)
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "AVS"
        cell.backgroundColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped!")
    }
    
}

