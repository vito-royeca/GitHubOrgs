//
//  OrganizationTableViewCell.swift
//  GitHubOrgs
//
//  Created by Vito Royeca on 6/9/22.
//

import UIKit
import SDWebImage

protocol OrganizationTableViewCellDelegate: NSObjectProtocol  {
    func open(url: URL)
}

class OrganizationTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Variables
    var delegate: OrganizationTableViewCellDelegate?
    var url: URL?
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapUrlLabel(tapGestureRecognizer:)))
        urlLabel.addGestureRecognizer(tapGesture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension OrganizationTableViewCell {
    func configure(avatarUrl: String, login: String, url: URL?, description: String?) {
        self.url = url
        
        avatarImageView.sd_setImage(with: URL(string: avatarUrl))
        loginLabel.text = login
        urlLabel.text = url?.absoluteString ?? ""
        descriptionLabel.text = description
    }
    
    @objc func didTapUrlLabel(tapGestureRecognizer: UITapGestureRecognizer) {
        if let delegate = delegate,
            let url = url {
            delegate.open(url: url)
        }
    }
}
