//
//  GIthubRepoEndpoint.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 29/03/23.
//

import Foundation

enum GithubRepoEndpoint: Endpoint {
    
    case search
    
    var method: HttpMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var rawValue: String {
        switch self {
        case .search:
            return Config.apiURL + "/search/repositories"
        }
    }
    
}
