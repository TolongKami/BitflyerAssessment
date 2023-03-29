//
//  InfoView.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 30/03/23.
//

import SwiftUI

struct InfoView: View {
    
    @ObservedObject var viewModel: InfoViewModel
    
    var body: some View {
        VStack {
            List {
                InfoItemView(
                    key: "Name",
                    value: viewModel.info.name
                )
                InfoItemView(
                    key: "URL",
                    value: viewModel.info.url
                )
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .navigationTitle("Repository Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(viewModel:InfoViewModel(
            info: InfoProps(
                name: "RxSwift",
                url: "https://github.com/rxswift"
            )
        ))
    }
}
