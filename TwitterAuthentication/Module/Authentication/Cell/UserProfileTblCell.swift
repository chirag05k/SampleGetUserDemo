//
//  UserProfileTblCell.swift
//  TwitterAuthentication
//
//  Created by Chirag Vekariya on 23/12/21.
//

import UIKit

class UserProfileTblCell: UITableViewCell {
    
    // MARK: -
    // MARK: - Outlet
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var btnLocation: UIButton!
    
    // MARK: -
    // MARK: - Variable
    var didTapOnMap: (UIButton) -> Void = {_ in}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnLocation.isHidden = !NetworkMonitor.shared.isReachable
    }
    
    // MARK: -
    // MARK: - SetUp Methods
    func setUpUserDetails(userInfo: UserInfo) {
        imgProfile.setImageFromURL(url: userInfo.picture?.thumbnail ?? "")
        lblName.text = userInfo.name?.first
        lblGender.text = userInfo.gender
    }
    
}

// MARK: -
// MARK: - Actions
extension UserProfileTblCell {
    
    @IBAction func btnLocationTapped(_ sender: UIButton) {
        didTapOnMap(sender)
    }
    
}
