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
    
    static func getUsername() -> String{
        return UserDefaults.standard.string(forKey: "userName") ?? ""
    }
    
    static func getAddress()-> String {
        return UserDefaults.standard.string(forKey: "userAddress") ?? ""
    }
    
    static func saveLogin(_ login: Bool) {
        UserDefaults.standard.set(login, forKey: "Login")
    }
    
    static func getLogin()-> Bool {
        UserDefaults.standard.bool(forKey: "Login")
    }
    
    static func saveRegister(_ register: Bool) {
        UserDefaults.standard.set(register, forKey: "Register")
    }
    
    static func getRegister() -> Bool {
        UserDefaults.standard.bool(forKey: "Register")
    }
    
    static func saveReminder(_ reminder: Bool) {
        UserDefaults.standard.set(reminder, forKey: "Reminder")
    }
    
    static func getReminder() -> Bool {
        return UserDefaults.standard.bool(forKey: "Reminder")
    }
    
    static func clearUserDefaults() {
        saveUserName("")
        saveAddress("")
        saveRegister(false)
        saveLogin(false)
        saveReminder(false)
    }
}
