//
//  GamePresenter.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//
//

import UIKit

enum GameTurn {
    case first
    case second
}

final class GamePresenter {

    // MARK: - Private properties -

    private unowned let view: GameViewInterface
    private let interactor: GameInteractorInterface
    private let wireframe: GameWireframeInterface
    
    private var gameData: [QuestionModel]?
    
    private let firstPlayer: String
    private let secondPlayer: String
    private var firstScore: Int = 0
    private var secondScore: Int = 0
    
    private var actualIndex: Int = 0
    private var actualTurn: GameTurn = .first

    // MARK: - Lifecycle -

    init(view: GameViewInterface, interactor: GameInteractorInterface, wireframe: GameWireframeInterface, firstPlayer: String, secondPlayer: String) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
    }
}

// MARK: - Extensions -

extension GamePresenter: GamePresenterInterface {

    func viewDidLoad() {
        view.setFirstPlayer(name: firstPlayer)
        view.setSecondPlayer(name: secondPlayer)
        view.setFirstPlayer(score: String(format: "Game.Points.message".localized, firstScore))
        view.setSecondPlayer(score: String(format: "Game.Points.message".localized, secondScore))
        
        getGameData()
    }
    
    func evaluate(answer: String) {
        if gameData?[actualIndex].correctAnswer?.htmlDecoded == answer {
            wireframe.showAlert(with: "Question.CorrectAnswer.title".localized, message: "Question.CorrectAnswer.message".localized, actions: [UIAlertAction(title: "OK", style: .default, handler: { [weak self] (_) in
                self?.incrementActualUserScore()
                self?.nextRound()
            })])
        } else {
            wireframe.showAlert(with: "Question.WrongAnswer.title".localized, message: "Question.WrongAnswer.message".localized, actions: [UIAlertAction(title: "OK", style: .default, handler: { [weak self] (_) in
                self?.nextRound()
            })])
        }
    }
    
    private func getGameData() {
        view.setLoadingVisible(true)
        interactor.getGameData { [weak self] (result: Result<[QuestionModel]?, Error>) in
            DispatchQueue.main.async {
                self?.view.setLoadingVisible(false)
                self?.handleGameRequestResult(result)
            }
        }
    }
    
    private func handleGameRequestResult(_ result: Result<[QuestionModel]?, Error>) {
        switch result {
        case .failure(let error):
            wireframe.showErrorAlert(with: error.localizedDescription)
        case .success(let data):
            gameData = data
            setActualIndexData()
        }
    }
    
    private func setActualIndexData() {
        DispatchQueue.main.async {
            self.view.setQuestion(title: self.gameData?[self.actualIndex].question?.htmlDecoded ?? "")
            self.view.configure(answers: self.gameData?[self.actualIndex].shuffledAnswers?.compactMap{ $0.htmlDecoded })
            self.view.setActualTurn(text: self.setActualPlayerText())
        }
    }
    
    private func setActualPlayerText() -> NSAttributedString {
        let turn = self.actualTurn == GameTurn.first ? self.firstPlayer : self.secondPlayer
        
        let str = String(format: "Game.Turn.message".localized, turn)
        
        let range = (str as NSString).range(of: turn)
        
        let attribute = NSMutableAttributedString(string: str)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: self.actualTurn == GameTurn.first ? UIColor.darkBlue: UIColor.lightBlue , range: range)
        attribute.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 20.0), range: NSRange(location: 0, length: str.count))
        
        return attribute
    }
 
    private func incrementActualUserScore() {
        switch actualTurn {
        case .first:
            firstScore += 1
            view.setFirstPlayer(score: String(format: "Game.Points.message".localized, firstScore))
        case .second:
            secondScore += 1
            view.setSecondPlayer(score: String(format: "Game.Points.message".localized, secondScore))
        }
    }
    
    private func nextRound() {
        
        guard let questions = gameData else { return }
        
        if questions.count - 1 > actualIndex {
            actualIndex += 1
            setActualIndexData()
            actualTurn = actualTurn == GameTurn.first ? .second : .first
        } else {
            //Finish
            let gameModel = GameModel(firstUser: firstPlayer, secondUser: secondPlayer, firstScore: firstScore, secondScore: secondScore, questions: questions)
            wireframe.navigate(to: .results(gameModel))
        }
    }
}
