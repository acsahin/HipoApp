//
//  Network.swift
//  HipoApp
//
//  Created by ACS on 21.04.2021.
//

import Foundation

class Database {
    
    var members = [Member]()
    
    init() {
        loadMembers()
    }
    
    private func loadMembers() {
        if let url = Bundle.main.url(forResource: "hipo", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Model.self, from: data)
                members = jsonData.members
            } catch {
                print("error-> loadMembers: \(error)")
            }
        }
    }
    
    func addMember() {
        let member = Member(name: "Ahmet Cemal Şahin", age: 25, location: "Istanbul", github: "acsahin", hipo: Hipo(position: "iOS Developer Intern", yearsInHipo: 0))
        members.append(member)
    }
}
