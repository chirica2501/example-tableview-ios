//
//  NetworkHandler.swift
//  example-tableview-ios
//
//  Created by Ricardo Granja on 10/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import Foundation

class NetworkHandler {
    static func request(urlRequest: URLRequest, _ completion : @escaping (_ data: Data?,_ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else { return }
            if let response = response {
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == RequestStatus.ok.rawValue {
                        completion(data, nil)
                    }
                    else {
                        completion(nil, error)
                    }
                }
                else if let Error = error {
                    completion(nil, Error)
                }
            }
        }.resume()
    }
}

//GET HEADER INFO
//let headers: [String : Any]? = (response as? HTTPURLResponse)?.allHeaderFields as? [String : Any]

//let users = try JSONDecoder().decode([User].self, from: data)
