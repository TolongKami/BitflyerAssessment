//
//  DefaultTextFieldStyle.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 30/03/23.
//

import SwiftUI

struct DefaultTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding([.top, .bottom], 10)
            .padding([.leading], 8.0)
            .background(
                RoundedRectangle(
                    cornerRadius: 8.0,
                    style: .continuous
                )
                .stroke(.gray, lineWidth: 1.0)
            ).padding()
    }
}
