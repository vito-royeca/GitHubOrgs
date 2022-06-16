//
//  Bindings.swift
//  GitHubOrgs
//
//  Created by Vito Royeca on 6/9/22.
//

import UIKit

// MARK: - UITableView

extension UITableView {
    
    /// Bind a UITableView in order to reload it automatically once the datasource array mutates
    ///
    /// Example:
    /// ```
    /// tableView.bindTo(viewModel.results)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo<T>(_ bindable: Binder<T>) {
        bindable.bind { [weak self] _ in
            self?.reloadData()
        }
    }
}

extension UILabel {
    
    /// Bind a UITableView in order to reload it automatically once the datasource array mutates
    ///
    /// Example:
    /// ```
    /// tableView.bindTo(viewModel.results)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo<T>(_ bindable: Binder<T>) {
        bindable.bind { [weak self] _ in
            self?.text = "\(bindable.value)"
        }
    }
}
