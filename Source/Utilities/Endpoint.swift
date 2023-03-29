//
//  Endpoint.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 29/03/23.
//

import Foundation

protocol Endpoint {
    
    var method: HttpMethod { get }
    
    var rawValue: String { get }
    
}
