//
//  NetworkHandler.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 29/03/23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

final class NetworkHandler {
    
    private var urlSessionConfig: URLSessionConfiguration {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        return config
    }
    
    private var urlSession: URLSession {
        let session: URLSession = URLSession(configuration: urlSessionConfig)
        return session
    }
    
    private var url: String
    private var headers: [[String: String]] = []
    private var parameters: [[String: Any]] = []
    
    private init(url: String) {
        self.url = url
    }
    
    public static func create(_ url: String) -> NetworkHandler {
        return NetworkHandler(url: url)
    }
    
    public func set(header: [String: String]) -> NetworkHandler {
        headers.append(header)
        return self
    }
    
    public func set(parameter: [String: Any]) -> NetworkHandler {
        parameters.append(parameter)
        return self
    }
    
    public func execute<T: Codable>(method: HttpMethod) async throws -> T? {
        
        guard let request = configureRequest(method: method) else {
            let error = NSError(
                domain: "NetworkHandler",
                code: -1,
                userInfo: [
                    NSLocalizedDescriptionKey: "Invalid Request"
                ]
            )
            
            throw error
        }
        
        let (data, response) = try await urlSession.data(for: request)
        
        guard let validResponse = response as? HTTPURLResponse else {
            return nil
        }
        
        let statusCode = validResponse.statusCode
        
        guard statusCode >= 200 && statusCode < 300 && !data.isEmpty else {
            return nil
        }
        
        let jsonDecoder = JSONDecoder()
        do {
            let output = try jsonDecoder.decode(T.self, from: data)
            return output
        } catch let exception {
            throw exception
        }
    }
    
    private func configureRequest(
        method: HttpMethod
    ) -> URLRequest? {
        
        guard let targetURL = URL(string: url) else {
            return nil
        }
        
        var request = URLRequest(url: targetURL)
        request.httpMethod = method.rawValue
        
        headers.forEach ({ (header: [String: String]) in
            header.forEach { (key: String, value: String) in
                request.setValue(value, forHTTPHeaderField: key)
            }
        })
        
        switch (!parameters.isEmpty, method) {
            
        case (true, .get):
            
            var urlComponents = URLComponents(string: url)
            parameters.forEach ({ (parameter: [String: Any]) in
                parameter.forEach { (key: String, value: Any) in
                    let queryItem = URLQueryItem(name: key, value: value as? String)
                    urlComponents?.queryItems?.append(queryItem)
                }
                
            })
            
            request.url = urlComponents?.url
            
        case (true, .post), (true, .put):
            let httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = httpBody
            
        default:
            break
            
        }
        
        return request
    }
    
}
