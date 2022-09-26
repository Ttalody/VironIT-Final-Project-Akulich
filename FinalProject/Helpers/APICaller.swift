//
//  APICaller.swift
//  FinalProject
//
//  Created by user on 19.09.2022.
//

import Foundation

class APICaller {
    
    static let shared = APICaller()
    
    func getGamesData(completion: @escaping (String) -> Void) {
        guard var urlComponents = URLComponents(string: APIConstants.baseURL + APIConstants.games) else { return }
        
        urlComponents.queryItems =
            [URLQueryItem(name: APIConstants.key, value: APIConstants.APIKey)]

        guard let url = urlComponents.url else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return print(error!.localizedDescription + " guard") }
            
            do {
                let results = try JSONDecoder().decode(ResponseModel.self, from: data)
                print(results.results?[0].name)
            } catch {
                print(String(describing: error))
            }
        }
        
        task.resume()
    }
}
