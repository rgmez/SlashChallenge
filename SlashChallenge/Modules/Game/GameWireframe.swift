//
//  GameWireframe.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//
//

import UIKit

final class GameWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Module setup -

    init(firstPlayer: String, secondPlayer: String) {
        let moduleViewController = storyboard.instantiateViewController(ofType: GameViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = GameInteractor()
        let presenter = GamePresenter(view: moduleViewController, interactor: interactor, wireframe: self, firstPlayer: firstPlayer, secondPlayer: secondPlayer)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension GameWireframe: GameWireframeInterface {
    func navigate(to option: GameNavOption) {
        switch option {
        case .results(let gameModel): navigateToGameResults(game: gameModel)
        }
    }
    
    private func navigateToGameResults(game: GameModel) {
        navigationController?.pushWireframe(ResultsWireframe(game: game))
    }
}
