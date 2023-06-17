//
//  CharitiesResponseModel.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/06/2023.
//

import Foundation

struct CharitiesResponseModel: Codable {
    let charity: Charity?
    let cases, urgentCases, doneCases: [Case]?
}
