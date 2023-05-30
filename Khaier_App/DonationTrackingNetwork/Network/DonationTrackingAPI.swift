//
//  DonationTrackingAPI.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 25/05/2023.
//

import Foundation

protocol DonationTrackingAPIProtocol {
    func donationDetailsRequest(completion: @escaping (Result<DonationTrackingResponseModel?, NSError>) -> Void)
    func myDonationRequest(completion: @escaping (Result<MyDonationResponseModel?, NSError>) -> Void)
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
}



