//
//  Main.swift
//  GitHubSearchSample
//
//  Created by Nanda Julianda Akbar on 28/03/23.
//

import SwiftUI

@main
struct Main: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .onChange(of: scenePhase) { phase in
                
                print("Api URL: \(Config.apiURL)")
                print("Access Token: \(Config.apiAccessToken)")
                
                Task(priority: .userInitiated) {
                    await httpRequest()
                }
                
                print("Current phase: \(phase)")
            }
        }
    }
}

func httpRequest() async {
    
    do {
        
        let githubRepoRepository = GithubRepoRepositoryDefault()
        let request = try await githubRepoRepository.search(repoName: "tetris")
        
        print(String(describing: request))
    } catch let exception {
        print(exception)
    }
}
