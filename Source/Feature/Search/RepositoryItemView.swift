//
//  RepositoryItemView.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 30/03/23.
//

import SwiftUI

struct RepositoryItemView: View {
    
    let item: RepositoryItemProps
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                Text(item.name).bold()
                Text(item.url).font(.caption)
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .leading
            )
        }
    }
}

struct RepositoryItem_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryItemView(
            item: RepositoryItemProps(
                id: 1,
                name: "Repo Name",
                url: "https://some-url.com"
            )
        )
    }
}
