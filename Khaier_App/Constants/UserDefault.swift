//
//  UserDefaults.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/04/2023.
//

import Foundation

class UserDefault {
    static func saveUserName(_ name: String) {
        UserDefaults.standard.set(name, forKey: "userName")
    }
    
    static func saveAddress(_ address: String) {
        UserDefaults.standard.set(address, forKey: "userAddress")
    }
    
    static func getUsername() {
        UserDefaults.standard.string(forKey: "userName")
    }
    
    static func getAddress() {
        UserDefaults.standard.string(forKey: "userAddress")
    }
}
