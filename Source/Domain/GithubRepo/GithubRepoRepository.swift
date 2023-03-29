//
//  GithubRepoRepository.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 29/03/23.
//

import Foundation

protocol GithubRepoRepository {
    
    func search(repoName: String) async throws -> GithubRepoModel
    
}
