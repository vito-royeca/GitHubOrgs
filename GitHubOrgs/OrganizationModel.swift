//
//  OrganizationModel.swift
//  GitHubOrgs
//
//  Created by Vito Royeca on 6/9/22.
//

import Foundation

struct OrganizationModel: Codable {

    enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeId = "node_id"
        case url
        case reposUrl = "repos_url"
        case eventsUrl = "events_url"
        case hooksUrl = "hooks_url"
        case issuesUrl = "issues_url"
        case membersUrl = "members_url"
        case publicMembersUrl = "public_members_url"
        case avatarUrl = "avatar_url"
        case description
    }
    
    var login: String
    var id: Int
    var nodeId: String
    var url: String
    var reposUrl: String
    var eventsUrl: String
    var hooksUrl: String
    var issuesUrl: String
    var membersUrl: String
    var publicMembersUrl: String
    var avatarUrl: String
    var description: String?
}
