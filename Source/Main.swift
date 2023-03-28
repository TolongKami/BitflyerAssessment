//
//  Main.swift
//  BitFlyerAssessment
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
                print("Current phase: \(phase)")
            }
        }
    }
}
