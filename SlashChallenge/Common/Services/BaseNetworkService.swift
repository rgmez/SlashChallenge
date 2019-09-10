//
//  BaseService.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import Foundation

enum ResultCode: Int {
    case success = 0
    case noResults = 1
    case invalidParameter = 2
    case tokenNotFound = 3
    case tokenEmpty = 4
    case generic = -1
    
    static func message(type: ResultCode) -> String {
        switch type {
        case .success: return ""
        case .noResults: return "Could not return results"
        case .invalidParameter: return " Contains an invalid parameter"
        case .tokenNotFound: return "Session Token does not exist"
        case .tokenEmpty: return "Session Token has returned all possible questions for the specified query."
            
        default:
            return "Generic Error"
        }
    }
}

enum AppError: Error {
    case custom(message: String?)
    case generic
}

class BaseNetworkService: NSObject {
    func getData<T: Codable>(url: URL?, completion: @escaping (_: Result<[T]?, Error>) -> Void) {
        guard let url = url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(ResponseModel<T>.self, from: data)
                
                
                let resultCode = ResultCode(rawValue: response.responseCode)
                
                if resultCode != ResultCode.success {
                    completion(Result.failure(AppError.custom(message: ResultCode.message(type: resultCode ?? ResultCode.generic))))
                } else {
                    completion(Result.success(response.results))
                }
                
            } catch {
                completion(Result.failure(error))
            }
            }.resume()
    }
}
