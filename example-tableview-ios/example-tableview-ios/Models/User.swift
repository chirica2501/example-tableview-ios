//
//  User.swift
//  example-tableview-ios
//
//  Created by Ricardo Granja on 10/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Codable {
    let street: String
    let suite:  String
    let city:  String
    let zipcode:  String
    let geo: Geo

}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}

struct Geo: Codable {
    let lat: String
    let lng: String
}
