//
//  GithubRepoRepositoryDefault.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 29/03/23.
//

import Foundation

struct GithubRepoRepositoryDefault: GithubRepoRepository {
    
    func search(repoName: String) async throws -> [GithubItemModel] {
        
        do {
            
            let endpoint = GithubRepoEndpoint.search.rawValue
            let method = GithubRepoEndpoint.search.method
            
            let response: GithubRepoModel = try await NetworkHandler.create(endpoint)
                .useDefaultGithubHeaders()
                .set(parameter: ["q": repoName])
                .execute(method: method)
            
            return response.items
        } catch let exception {
            throw exception
        }
    }
    
}
