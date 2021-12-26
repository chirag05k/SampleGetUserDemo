//
//  FollowerAndFollowingViewController.swift
//  TwitterAuthentication
//
//  Created by Chirag Vekariya on 23/12/21.
//

import UIKit

class UserListViewController: UIViewController {
    
    // MARK: -
    // MARK: - Outlet
    @IBOutlet weak var tblUserList: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: -
    // MARK: - Variable
    fileprivate let viewModel           = UserViewModel()
    private let estimatedRowHeight      = 300.0
    
    // MARK: -
    // MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetUP()
    }
    
}

// MARK: -
// MARK: - SetUp Methods
extension UserListViewController {
    
    private func initialSetUP() {
        activityIndicator.startAnimating()
        bindViewModel()
        tblViewSetUP()
        viewModel.apiSuccess.value = MapManager.shared.currentUser
        viewModel.getListOfUser()
    }
    
    private func tblViewSetUP() {
        tblUserList.estimatedRowHeight  = estimatedRowHeight
        tblUserList.rowHeight           = UITableView.automaticDimension
    }
    
    private func bindViewModel() {
        viewModel.apiError.bind { [weak self] apiError in
            guard let uSelf = self else { return }
            DispatchQueue.main.async {
                uSelf.activityIndicator.stopAnimating()
                UIAlertController.showAlert(with: apiError, on: uSelf)
            }
        }
        viewModel.apiSuccess.bind { [weak self] userDetails in
            guard let uSelf = self else { return }
            MapManager.shared.currentUser = uSelf.viewModel.apiSuccess.value
            DispatchQueue.main.async {
                uSelf.activityIndicator.stopAnimating()
                uSelf.tblUserList.reloadData()
            }
        }
    }
    
}

// MARK: -
// MARK: - UITableViewDataSource
extension UserListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.apiSuccess.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppIdentifiers.userProfileTblCell, for: indexPath) else { return UITableViewCell() }
        cell.setUpUserDetails(userInfo: viewModel.apiSuccess.value[indexPath.row])
        cell.didTapOnMap = { [weak self] _ in
            guard let uSelf = self else { return }
            if let mapViewController = AppStoryBoard.main.mapViewController() {
                mapViewController.coordinate = uSelf.viewModel.apiSuccess.value[indexPath.row].location?.coordinates
                uSelf.navigationController?.pushViewController(mapViewController, animated: true)
            }
        }
        return cell
    }
    
}
