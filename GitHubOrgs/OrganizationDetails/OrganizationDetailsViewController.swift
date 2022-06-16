//
//  OrganizationDetailsViewController.swift
//  GitHubOrgs
//
//  Created by Vito Royeca on 6/16/22.
//

import UIKit

class OrganizationDetailsViewController: UIViewController {

    private let viewModel = OrganizationDetailsViewModel()
    var login: String?
    var loginLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        view.backgroundColor = UIColor.systemBackground
        
        loginLabel = UILabel()
        loginLabel!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginLabel!)
        
        NSLayoutConstraint.activate([
            loginLabel!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            loginLabel!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            loginLabel!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            loginLabel!.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        ])

        setupBindings()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let login = login {
            viewModel.performFetch(login: login)
        }
    }
    
    func setupBindings() {
        loginLabel!.bindTo(viewModel.results)
    }
    
//    init(login: String) {
//        super.init(coder: <#T##NSCoder#>)
//        self.login = login
//
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
