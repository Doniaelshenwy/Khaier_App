//
//  DonationTrackingAPI.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 25/05/2023.
//

import Foundation


//struct UpdateProfileRequestModel {
//    var name: String?
//    var cityId: Int?
//    var districtId: Int?
//    var thumbnail: String?
//}
//
//struct UpdateProfilePasswordRequestModel {
//    var oldPassword: String
//    var password: String
//    var passwordConfirmation: String
//}

protocol DonationTrackingAPIProtocol {
    func donationDetailsRequest(completion: @escaping (Result<DonationTrackingResponseModel?, NSError>) -> Void)
}

class DonationTrackingAPI : BaseAPI<DonationTrackingNetwork>, DonationTrackingAPIProtocol {
    func donationDetailsRequest(completion: @escaping (Result<DonationTrackingResponseModel?, NSError>) -> Void) {
        fetchData(target: .donationDetails, responseClass: DonationTrackingResponseModel.self) { result in
            completion(result)
        }
    }
}



