//
//  ResultsWireframe.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//


import UIKit

final class ResultsWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Module setup -

    init(game: GameModel) {
        let moduleViewController = storyboard.instantiateViewController(ofType: ResultsViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = ResultsInteractor()
        let presenter = ResultsPresenter(view: moduleViewController, interactor: interactor, wireframe: self, gameModel: game)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ResultsWireframe: ResultsWireframeInterface {
    
    func navigate(to option: ResultsNavOption) {
        switch option {
        case .anotherOpponents: anotherOpponents()
        case .showResults: navigateToResults()
        }
    }
    
    private func anotherOpponents() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func navigateToResults() {
        navigationController?.pushWireframe(ResultListWireframe())
        
        navigationController?.viewControllers.removeAll(where: {
            $0.isKind(of: GameViewController.self) || $0.isKind(of: ResultsViewController.self)
        })
    }
}
