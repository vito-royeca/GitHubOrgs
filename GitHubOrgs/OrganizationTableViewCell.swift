//
//  OrganizationTableViewCell.swift
//  GitHubOrgs
//
//  Created by Vito Royeca on 6/9/22.
//

import UIKit
import SDWebImage

class OrganizationTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(avatarUrl: String, login: String, url: String, description: String?) {
        avatarImageView.sd_setImage(with: URL(string: avatarUrl))
        loginLabel.text = login
        urlLabel.text = url
        descriptionLabel.text = description
    }
}
