//
//  UserRouter.swift
//  example-tableview-ios
//
//  Created by Ricardo Granja on 10/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import Foundation

class UserRouter {
    static func getUsers(compilation : @escaping (_ content: [User]?,_ error: Error?) -> Void) {
        guard let urlString = URL(string: RoadURL.baseURL.rawValue + Path.users.rawValue) else { return }
        var urlRequest = URLRequest(url: urlString)

        urlRequest.httpMethod = HTTPMethod.GET.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        NetworkHandler.request(urlRequest: urlRequest, { (data, error) in
            do {
                if let Data = data {
                    let users = try JSONDecoder().decode([User].self, from: Data)
                    compilation(users, nil)
                }
                else if let Error = error {
                    compilation(nil, Error)
                }
            }
            catch let requestError {
                compilation(nil, requestError)
            }
        })
    }
}
