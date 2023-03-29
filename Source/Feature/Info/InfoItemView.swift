//
//  InfoItemView.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 30/03/23.
//

import SwiftUI

struct InfoItemView: View {
    
    let key: String
    let value: String
    
    var body: some View {
        HStack {
            Text("\(key): ").bold()
            Text(value).font(.caption)
        }
    }
}

struct InfoItemView_Previews: PreviewProvider {
    static var previews: some View {
        InfoItemView(
            key: "name",
            value: "RxSwift"
        )
    }
}
