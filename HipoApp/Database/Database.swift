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
        
        
//        let member2 = Member(name: "Ahmet Cemal Şaahin", age: 25, location: "Istanbul", github: "acsahin", hipo: Hipo(position: "iOS Developer Intern", yearsInHipo: 0))
//        members.append(member2)
//
//        let member3 = Member(name: "Ahmet Cemal hin", age: 25, location: "Istanbul", github: "acsahin", hipo: Hipo(position: "iOS Developer Intern", yearsInHipo: 0))
//        members.append(member3)
//
//        let member4 = Member(name: "Ahmet Cemal mahin", age: 25, location: "Istanbul", github: "acsahin", hipo: Hipo(position: "iOS Developer Intern", yearsInHipo: 0))
//        members.append(member4)
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
