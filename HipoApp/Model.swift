//
//  Model.swift
//  HipoApp
//
//  Created by ACS on 21.04.2021.
//

import Foundation

// MARK: - Model
struct Model: Codable {
    let company, team: String
    let members: [Member]
}

// MARK: - Member
struct Member: Codable {
    let name: String
    let age: Int
    let location, github: String
    let hipo: Hipo
}

// MARK: - Hipo
struct Hipo: Codable {
    let position: String
    let yearsInHipo: Int

    enum CodingKeys: String, CodingKey {
        case position
        case yearsInHipo = "years_in_hipo"
    }
}
