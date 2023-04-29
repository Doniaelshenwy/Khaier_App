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
    
    static func saveCity(_ city: String) {
        UserDefaults.standard.set(city, forKey: "userCity")
    }
    
    static func getCity()-> String {
        return UserDefaults.standard.string(forKey: "userCity") ?? ""
    }
    
    static func saveRegion(_ region: String) {
        UserDefaults.standard.set(region, forKey: "userRegion")
    }
    
    static func getRegion()-> String {
        return UserDefaults.standard.string(forKey: "userRegion") ?? ""
    }
    
    static func getUsername() -> String{
        return UserDefaults.standard.string(forKey: "userName") ?? ""
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
    
    static func getRegionId() -> Int {
        UserDefaults.standard.integer(forKey: "RegionID")
    }
    
    static func saveRegionId(_ id: Int) {
        UserDefaults.standard.set(id, forKey: "RegionID")
    }
    
    static func getCityId() -> Int {
        UserDefaults.standard.integer(forKey: "CityID")
    }
    
    static func saveCityId(_ id: Int) {
        UserDefaults.standard.set(id, forKey: "CityID")
    }
    
    static func clearUserDefaults() {
        saveUserName("")
        saveCity("")
        saveRegion("")
        saveRegister(false)
        saveLogin(false)
        saveReminder(false)
    }
}
