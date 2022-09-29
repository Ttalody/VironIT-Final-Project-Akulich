//
//  NetworkManager.swift
//  FinalProject
//
//  Created by user on 19.09.2022.
//

import Foundation

class NetworkManager {
    
    private static let defaultSession = URLSession(configuration: .default)
    private static var dataTask: URLSessionDataTask?
    
    static func makeRequest(page: UInt, completion: @escaping (Result<ResponseModel?, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: APIConstants.baseURL + APIConstants.games) else { return }
        
        urlComponents.queryItems =
            [URLQueryItem(name: APIConstants.key, value: APIConstants.APIKey),
             URLQueryItem(name: APIConstants.page, value: String(page))]
        
        guard let url = urlComponents.url else { return }
        
        dataTask = defaultSession.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else { return print(error!.localizedDescription) }
            
            do {
                let responseResult = try JSONDecoder().decode(ResponseModel.self, from: data)
                completion(.success(responseResult))
            } catch {
                completion(.failure(error))
            }
            
        }
        
        dataTask?.resume()
    }
    
    static func makeSearchRequest(text: String, completion: @escaping (Result<ResponseModel?, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: APIConstants.baseURL + APIConstants.games) else { return }
        
        urlComponents.queryItems =
            [URLQueryItem(name: APIConstants.key, value: APIConstants.APIKey),
             URLQueryItem(name: APIConstants.search, value: text)]
        
        guard let url = urlComponents.url else { return }
        
        dataTask = defaultSession.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else { return print(error!.localizedDescription) }
            
            do {
                let responseResult = try JSONDecoder().decode(ResponseModel.self, from: data)
                completion(.success(responseResult))
            } catch {
                completion(.failure(error))
            }
            
        }
        
        dataTask?.resume()
    }
    
    static func makeGenreRequest(genre: String, pageSize: UInt?, completion: @escaping (Result<ResponseModel?, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: APIConstants.baseURL + APIConstants.games) else { return }
        
        urlComponents.queryItems =
            [URLQueryItem(name: APIConstants.key, value: APIConstants.APIKey),
             URLQueryItem(name: APIConstants.genres, value: genre)]
        if let pageSize = pageSize {
            urlComponents.queryItems?.append(URLQueryItem(name: APIConstants.pageSize, value: String(describing: pageSize)))
        }
        
        guard let url = urlComponents.url else { return }
        
        dataTask = defaultSession.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else { return print(error!.localizedDescription) }
            
            do {
                let responseResult = try JSONDecoder().decode(ResponseModel.self, from: data)
                completion(.success(responseResult))
            } catch {
                completion(.failure(error))
            }
            
        }
        
        dataTask?.resume()
    }
}
