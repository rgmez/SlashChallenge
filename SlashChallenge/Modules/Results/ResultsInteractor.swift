//
//  ResultsInteractor.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//


import Foundation

final class ResultsInteractor {
}

// MARK: - Extensions -

extension ResultsInteractor: ResultsInteractorInterface {
    func saveResult(data: GameModel) {
        ResultService.addNewGameResult(gameResult: data)
    }
}
