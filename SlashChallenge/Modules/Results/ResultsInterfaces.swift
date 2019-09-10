//
//  ResultsInterfaces.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//


import UIKit

enum ResultsNavOption {
    case anotherOpponents
    case showResults
}

protocol ResultsWireframeInterface: WireframeInterface {
    func navigate(to option: ResultsNavOption)
}

protocol ResultsViewInterface: ViewInterface {
    func setFirstPlayer(name: String)
    func setSecondPlayer(name: String)
    func setFirstPlayer(score: String)
    func setSecondPlayer(score: String)
    func setResult(text: String)
    func setResult(image: String)
}

protocol ResultsPresenterInterface: PresenterInterface {
    func didSelectAnotherOpponent()
    func didSelectShowResults()
}

protocol ResultsInteractorInterface: InteractorInterface {
    func saveResult(data: GameModel)
}
