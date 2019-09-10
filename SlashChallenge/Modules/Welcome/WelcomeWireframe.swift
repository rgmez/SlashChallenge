//
//  WelcomeWireframe.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//
//

import UIKit

final class WelcomeWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: WelcomeViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = WelcomeInteractor()
        let presenter = WelcomePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension WelcomeWireframe: WelcomeWireframeInterface {
    func navigate(to option: WelcomeNavOption) {
        switch option {
        case .game(let first, let second): navigateToGame(firstPlayer: first, secondPlayer: second)
        case .results: navigateToResults()
        }
    }
    
    private func navigateToGame(firstPlayer: String, secondPlayer: String) {
        navigationController?.pushWireframe(GameWireframe(firstPlayer: firstPlayer, secondPlayer: secondPlayer))
    }
    
    private func navigateToResults() {
        navigationController?.pushWireframe(ResultListWireframe())
    }
}
