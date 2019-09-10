//
//  ResultListInteractor.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 05/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//

import Foundation

final class ResultListInteractor {
}

// MARK: - Extensions -

extension ResultListInteractor: ResultListInteractorInterface {
    func getResults() -> [ResultData]? {
        return ResultService.getResults()
    }
}
