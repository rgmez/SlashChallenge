//
//  GameService.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import UIKit

typealias GameCompletionBlock = (_: Result<[QuestionModel]?, Error>) -> Void

final class GameService: BaseNetworkService {
    
    func getGameData(params: [String: String], completion: @escaping GameCompletionBlock) {
        
        guard var components = URLComponents(string: "https://opentdb.com/api.php") else { return }
        
        components.queryItems = params.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
    
        getData(url: components.url, completion: completion)
    }
}
