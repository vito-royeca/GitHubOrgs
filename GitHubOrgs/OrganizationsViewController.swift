//
//  ViewController.swift
//  GitHubOrgs
//
//  Created by Vito Royeca on 6/9/22.
//

import UIKit

class OrganizationsViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    let viewModel = OrganizationsViewModel()
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViewController()
        loadOrganizations()
    }

}

private extension OrganizationsViewController {
    func setupViewController() {
        tableView.dataSource = self
        tableView.delegate = self
        title = "GitHub Organizations"
        setupBindings()
    }
    
    func setupBindings() {
        tableView.bindTo(viewModel.results)
    }
    
    func loadOrganizations() {
        viewModel.performFetch()
    }
}

// MARK: - UITableViewDataSource

extension OrganizationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.results.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let organization = viewModel.organization(at: indexPath.row)
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "organizationCell", for: indexPath) as? OrganizationTableViewCell {
            cell.configure(avatarUrl: organization.avatarUrl,
                           login: organization.login,
                           url: organization.url,
                           description: organization.description)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension OrganizationsViewController: UITableViewDelegate {
    
}
