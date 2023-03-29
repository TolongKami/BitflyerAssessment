//
//  GithubRepoModel.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 29/03/23.
//

import Foundation

struct GithubRepoModel: Codable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [GithubItemModel]
}

struct GithubItemModel: Codable {
    let id: Int
    let name: String
    let full_name: String
    let url: String
    let html_url: String
    let owner: GithubOwnerModel
}

struct GithubOwnerModel: Codable {
    let id: Int
    let login: String
    let url: String
    let html_url: String
}
