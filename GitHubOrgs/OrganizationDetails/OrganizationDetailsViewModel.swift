//
//  OrganizationDetailsViewModel.swift
//  GitHubOrgs
//
//  Created by Vito Royeca on 6/16/22.
//

import Foundation

class OrganizationDetailsViewModel {
    
    let results: Binder<OrganizationDetailsModel> = Binder(OrganizationDetailsModel(login: ""))
    let error: Binder<String?> = Binder(nil)
    
    func performFetch(login: String) {
//        guard let url = URL(
//            string: "https://api.github.com/organizations?per_page=30"
//        ) else {
//            return
//        }
//
//        Task {
//            do {
//                let (data, _) = try await URLSession.shared.data(from: url)
//                let response = try JSONDecoder()
//                    .decode([OrganizationModel].self, from: data)
//                results.value = response
//            } catch {
//                self.error.value = "*** ERROR ***"
//            }
//        }
        
        let organizationDetailsModel = OrganizationDetailsModel(login: login)
        
        results.value = organizationDetailsModel
    }
}
