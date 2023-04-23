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
    
    static func saveLogin(_ login: Bool) {
        UserDefaults.standard.set(login, forKey: "Login")
    }
    
    static func getLogin() {
        UserDefaults.standard.string(forKey: "Login")
    }
    
    static func saveRegister(_ register: Bool) {
        UserDefaults.standard.set(register, forKey: "Register")
    }
    
    static func getRegister() {
        UserDefaults.standard.string(forKey: "Register")
    }
    
    static func saveReminder(_ reminder: Bool) {
        UserDefaults.standard.set(reminder, forKey: "Register")
    }
    
    static func getReminder() {
        UserDefaults.standard.string(forKey: "Register")
    }
    
    static func clearUserDefaults() {
        saveUserName("")
        saveAddress("")
        saveRegister(false)
        saveLogin(false)
        saveReminder(false)
    }
}
