//
//  SearchViewModel.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 30/03/23.
//

import Foundation
import Combine

@MainActor
final class SearchViewModel: ObservableObject {
    
    enum State<T> {
        case initial
        case loading
        case success(T)
        case error(String)
    }
    
    @Published var searchKeyword: String = ""
    
    @Published private(set) var searchState: State<[RepositoryItemProps]> = .initial
    
    func searchRepositories() {
        
        guard searchKeyword.count > 2 else {
            return
        }
        
        searchState = .loading
        
        Task(priority: .userInitiated) {
            do {
                
                let githubRepoRepository = GithubRepoRepositoryDefault()
                let items: [GithubItemModel] = try await githubRepoRepository.search(repoName: searchKeyword)
                
                let repositories = items.map { (item: GithubItemModel) in
                    return RepositoryItemProps(
                        id: item.id,
                        name: item.name,
                        url: item.html_url
                    )
                }
                
                searchState = .success(repositories)
                
            } catch let exception {
                searchState = .error(exception.localizedDescription)
            }
        }
    }
    
}
