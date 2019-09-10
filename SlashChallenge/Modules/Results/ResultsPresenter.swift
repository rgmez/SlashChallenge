//
//  ResultsPresenter.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//


import UIKit

final class ResultsPresenter {

    // MARK: - Private properties -

    private unowned let view: ResultsViewInterface
    private let interactor: ResultsInteractorInterface
    private let wireframe: ResultsWireframeInterface
    
    private let gameModel: GameModel

    // MARK: - Lifecycle -

    init(view: ResultsViewInterface, interactor: ResultsInteractorInterface, wireframe: ResultsWireframeInterface, gameModel: GameModel) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.gameModel = gameModel
    }
}

// MARK: - Extensions -

extension ResultsPresenter: ResultsPresenterInterface {
    
    func viewDidLoad() {
        view.setFirstPlayer(name: gameModel.firstUser)
        view.setSecondPlayer(name: gameModel.secondUser)
        view.setFirstPlayer(score: String(format: "Game.Points.message".localized, gameModel.firstScore))
        view.setSecondPlayer(score: String(format: "Game.Points.message".localized, gameModel.secondScore))
        calculateResult()
        saveResultData()
    }
    
    func didSelectAnotherOpponent() {
        wireframe.navigate(to: .anotherOpponents)
    }
    
    func didSelectShowResults() {
        wireframe.navigate(to: .showResults)
    }
    
    private func calculateResult() {
        
        var result = ""
        var image = ""
        
        if gameModel.firstScore > gameModel.secondScore {
            result = String(format: "Results.text".localized, gameModel.firstUser)
            image = "win"
        } else if gameModel.firstScore < gameModel.secondScore {
            result = String(format: "Results.text".localized, gameModel.secondUser)
            image = "win"
        } else {
            result = "Results.Tie.text".localized
            image = "tie"
        }
        
        view.setResult(text: result)
        view.setResult(image: image)
    }
    
    private func saveResultData() {
        interactor.saveResult(data: gameModel)
    }
}
