//
//  HomeView.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 29/03/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text(Config.appName)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
