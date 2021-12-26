//
//  AuthenticationViewModel.swift
//  TwitterAuthentication
//
//  Created by Chirag Vekariya on 21/12/21.
//

import Foundation

class UserViewModel: NSObject {
    
    // MARK: -
    // MARK: - Variable declaration
    internal let apiError               = Dynamic<String>("")
    internal var apiSuccess             = Dynamic<[UserInfo]>([])
    
    // MARK: -
    // MARK: - API Methods
    func getListOfUser() {
        guard let url = URL(string: AppConstant.BaseURL) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else {
                self.apiError.value = error?.localizedDescription ?? ""
                return
            }
            do {
                AppJsonParser.decodeObject(of: UserDetails.self, dataResponse) { result in
                    switch result {
                    case .success(let user):
                        self.apiSuccess.value = user.results ?? []
                    case .failure(let error):
                        self.apiError.value = error.localizedDescription
                    }
                }
            }
        }
        task.resume()
    }
    
}
