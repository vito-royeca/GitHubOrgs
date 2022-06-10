//
//  OrganizationsViewModel.swift
//  GitHubOrgs
//
//  Created by Vito Royeca on 6/9/22.
//

import Foundation

class OrganizationsViewModel {
    
    let results: Binder<[OrganizationModel]> = Binder([])
    let error: Binder<String?> = Binder(nil)
    
    func performFetch() {
        guard let url = URL(
            string: "https://api.github.com/organizations?per_page=30"
        ) else {
            return
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder()
                    .decode([OrganizationModel].self, from: data)
                results.value = response
            } catch {
                self.error.value = "*** ERROR ***"
            }
        }
    }
    
    func organization(at index: Int) -> OrganizationModel {
        return results.value[index]
    }
}
