//
//  AuthManger.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 08/02/2023.
//

import FirebaseAuth

class AuthManager {
    
    static let shared = AuthManager()
    private let auth = Auth.auth()
    
    public func startAuth(phoneNumber: String, completion: @escaping (Bool) -> Void){
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationId, error in
            guard let verificationId = verificationId, error == nil else {
                completion(false)
                return
            }
            UserDefaults.standard.set(verificationId, forKey: "ID")
            completion(true)
        }
    }
    
    public func verifyCode(smsCode: String, completion: @escaping (Bool) -> Void){
        let id = UserDefaults.standard.string(forKey: "ID")
        guard let verificationId = id else {
            completion(false)
            return
        }
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: smsCode)
        auth.signIn(with: credential) { result, error in
            guard  error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
}
