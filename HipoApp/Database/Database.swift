//
//  Network.swift
//  HipoApp
//
//  Created by ACS on 21.04.2021.
//

import Foundation

class Database {
    
    var members = [Member]()
    
    func loadMembers(reloader: @escaping ()->()) {
        DispatchQueue.global().async {
            if let url = Bundle.main.url(forResource: "hipo", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(Model.self, from: data)
                    self.members = jsonData.members
                } catch {
                    print("error-> loadMembers: \(error)")
                }
            }
            DispatchQueue.main.async {
                reloader()
            }
        }

    }
    
    
    func addMember() {
        let member = Member(name: "Ahmet Cemal Şahin", age: 25, location: "Istanbul", github: "acsahin", hipo: Hipo(position: "iOS Developer Intern", yearsInHipo: 0))
        members.append(member)
    }
    
    
    func getLastNames() -> [String] {
        var lastNames = [String]()
        for i in members {
            lastNames.append(String(i.name.split(separator: " ").last!).lowercased())
        }
        return lastNames
    }
    
    
    // Reorder member list by comparing with sorted last names
    func reorderBy(_ lastNames: [String]) {
        for i in 0..<lastNames.count {
            for j in i..<lastNames.count {
                if String((members[j].name.split(separator: " ").last?.lowercased())!) == lastNames[i] {
                    members.swapAt(i, j)
                }
            }
        }
    }
    
}
