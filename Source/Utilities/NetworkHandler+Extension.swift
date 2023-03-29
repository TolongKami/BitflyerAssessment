//
//  NetworkHandler+Extension.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 29/03/23.
//

import Foundation

extension NetworkHandler {
    
    func useDefaultGithubHeaders() -> NetworkHandler {
        let _ = useGithubHeaders()
        let _ = useGithubApiAuthorization()
        return self
    }
    
    private func useGithubHeaders() -> NetworkHandler {
        return set(
            header: [
                "Accept": "application/vnd.github+json",
                "X-GitHub-Api-Version": "2022-11-28"
            ]
        )
    }
    
    private func useGithubApiAuthorization() -> NetworkHandler {
        return set(
            header: [
                "Authorization": "Bearer \(Config.apiAccessToken)"
            ]
        )
    }
    
}
