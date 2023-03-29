//
//  InfoViewModel.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 30/03/23.
//

import Foundation
import Combine

final class InfoViewModel: ObservableObject {
    
    @Published private(set) var info: InfoProps
    
    init(info: InfoProps) {
        self.info = info
    }
}
