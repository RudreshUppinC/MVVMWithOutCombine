//
//  UsersViewModel.swift
//  MVVMWithOutCombine
//
//  Created by RudreshUppin on 10/05/25.
//

import Foundation
class UsersViewModel {
    private let apiService: APIServiceProtocol
    var users: [User] = [] {
        didSet {
            onUsersUpdated?()
        }
    }
    var error: String? {
        didSet {
            onErrorUpdated?()
        }
    }
    var onUsersUpdated: (() -> Void)?
    var onErrorUpdated: (() -> Void)?
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func fetchUsers() {
        apiService.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self?.users = users
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
            }
        }
    }
}
