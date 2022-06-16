//
//  OrganizationDetailsModel.swift
//  GitHubOrgs
//
//  Created by Vito Royeca on 6/16/22.
//

struct OrganizationDetailsModel: Codable {

    enum CodingKeys: String, CodingKey {
        case login

    }
    
    var login: String
}
