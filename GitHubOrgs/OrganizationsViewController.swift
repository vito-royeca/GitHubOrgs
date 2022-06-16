//
//  ViewController.swift
//  GitHubOrgs
//
//  Created by Vito Royeca on 6/9/22.
//

import UIKit
import SafariServices

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
        let url = viewModel.url(of: organization)
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "organizationCell", for: indexPath) as? OrganizationTableViewCell {
            cell.configure(avatarUrl: organization.avatarUrl,
                           login: organization.login,
                           url: url,
                           description: organization.description)
            cell.delegate = self
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension OrganizationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let organization = viewModel.organization(at: indexPath.row)
        let detailsView = OrganizationDetailsViewController()
        detailsView.login = organization.login
        
        self.navigationController?.pushViewController(detailsView, animated: true)
    }
    
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//
//    }
}

// MARK: - OrganizationTableViewCellDelegate

extension OrganizationsViewController: OrganizationTableViewCellDelegate {
    func open(url: URL) {
        let config = SFSafariViewController.Configuration()
//        config.entersReaderIfAvailable = true

        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
    
}
