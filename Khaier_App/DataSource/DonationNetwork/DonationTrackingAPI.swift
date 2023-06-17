//
//  DonationTrackingAPI.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 25/05/2023.
//

import Foundation

struct AddDonationRequestModel {
    var id: Int
    var description: String
    var quantity: Int
    var pickUpDate: String
    var pickUpStartTime: String
    var pickUpEndTime: String
    var pickUpAddress: String
    var thrumbnail: String
}

protocol DonationTrackingAPIProtocol {
    func donationDetailsRequest(completion: @escaping (Result<DonationTrackingResponseModel?, NSError>) -> Void)
    func myDonationRequest(completion: @escaping (Result<MyDonationResponseModel?, NSError>) -> Void)
    func addDonationRequest(model: AddDonationRequestModel, completion: @escaping (Result<ProfileResponseModel?, NSError>) -> Void)
}

class DonationTrackingAPI : BaseAPI<DonationNetwork>, DonationTrackingAPIProtocol {
    func donationDetailsRequest(completion: @escaping (Result<DonationTrackingResponseModel?, NSError>) -> Void) {
        fetchData(target: .donationDetails, responseClass: DonationTrackingResponseModel.self) { result in
            completion(result)
        }
    }
    
    func myDonationRequest(completion: @escaping (Result<MyDonationResponseModel?, NSError>) -> Void) {
        fetchData(target: .myDonation, responseClass: MyDonationResponseModel.self) { result in
            completion(result)
        }
    }
    
    func addDonationRequest(model: AddDonationRequestModel, completion: @escaping (Result<ProfileResponseModel?, NSError>) -> Void) {
        fetchData(target: .addDonation(model: model), responseClass: ProfileResponseModel.self) { result in
            completion(result)
        }
    }
}
