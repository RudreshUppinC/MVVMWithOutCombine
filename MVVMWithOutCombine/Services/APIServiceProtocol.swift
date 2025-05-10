//
//  APIServiceProtocol.swift
//  MVVMWithOutCombine
//
//  Created by RudreshUppin on 10/05/25.
//

import Foundation
protocol APIServiceProtocol {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
}
