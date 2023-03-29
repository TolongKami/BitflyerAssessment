//
//  SearchView.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 30/03/23.
//

import SwiftUI
import Combine

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack {
            
            TextField("Search repositories", text: $viewModel.searchKeyword)
                .textFieldStyle(DefaultTextFieldStyle())
                .padding([.leading, .trailing], 8.0)
                .onReceive(
                    viewModel.$searchKeyword.throttle(
                        for: 1.0,
                        scheduler: RunLoop.main,
                        latest: true
                    )
                ) { _ in
                    viewModel.searchRepositories()
                }
            
            switch viewModel.searchState {
            case .initial:
                EmptyView()
                
            case .loading:
                LoadingView()
                
            case .success(let repositories):
                List(repositories, id: \.id) { (item: RepositoryItemProps) in
                    NavigationLink {
                        InfoView(viewModel: InfoViewModel(
                            info: InfoProps(
                                name: item.name,
                                url: item.url
                            )
                        ))
                    } label: {
                        RepositoryItemView(item: item)
                    }
                }
                
            case .error(let errorMessage):
                ErrorView(text: errorMessage)
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top
        )
        .navigationTitle("Search Repositories")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
