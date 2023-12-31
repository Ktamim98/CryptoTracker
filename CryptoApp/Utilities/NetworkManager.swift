//
//  NetworkManager.swift
//  CryptoApp
//
//  Created by Tamim Khan on 4/7/23.
//

import Foundation
import Combine

class NetworkManager{
    
    enum NetworkingError: LocalizedError{
        case badUrlResponse(url: URL)
        case unknown
        
        var errorDescription: String?{
            switch self{
            case .badUrlResponse(url: let url): return "[🔥] Bad Response from URL: \(url)"
            case .unknown: return "[⚠️] Unknown Problem occured"
            }
        }
    }
    
    
    static func download(url: URL) -> AnyPublisher<Data, Error>{
       return URLSession.shared.dataTaskPublisher(for: url)
             .tryMap({ try handleUrlResponse(output: $0, url: url)})
             .retry(3)
             .eraseToAnyPublisher()
    }
    
    static func handleUrlResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else{
            throw NetworkingError.badUrlResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion{
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
