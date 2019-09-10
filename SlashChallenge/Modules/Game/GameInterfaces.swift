//
//  GameInterfaces.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//
//

import UIKit

enum GameNavOption {
    case results(GameModel)
}

protocol GameWireframeInterface: WireframeInterface {
    func navigate(to option: GameNavOption)
}

protocol GameViewInterface: ViewInterface {
    func setLoadingVisible(_ visible: Bool)
    func setFirstPlayer(name: String)
    func setSecondPlayer(name: String)
    func setFirstPlayer(score: String)
    func setSecondPlayer(score: String)
    func setActualTurn(text: NSAttributedString)
    func setQuestion(title: String)
    func configure(answers: [String]?)
}

protocol GamePresenterInterface: PresenterInterface {
    func evaluate(answer: String)
}

protocol GameInteractorInterface: InteractorInterface {
    func getGameData(_ completion: @escaping GameCompletionBlock)
}
