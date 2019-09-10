//
//  GameInteractor.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//
//

import Foundation

final class GameInteractor {
    fileprivate let gameService = GameService()
}

// MARK: - Extensions -

extension GameInteractor: GameInteractorInterface {
    func getGameData(_ completion: @escaping GameCompletionBlock) {
        gameService.getGameData(params: ["amount": "10", "type": "multiple"], completion: completion)
    }
}
