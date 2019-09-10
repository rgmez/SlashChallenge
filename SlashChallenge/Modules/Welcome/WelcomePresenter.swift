//
//  WelcomePresenter.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//
//

import UIKit

final class WelcomePresenter {

    // MARK: - Private properties -

    private unowned let view: WelcomeViewInterface
    private let interactor: WelcomeInteractorInterface
    private let wireframe: WelcomeWireframeInterface

    // MARK: - Lifecycle -

    init(view: WelcomeViewInterface, interactor: WelcomeInteractorInterface, wireframe: WelcomeWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension WelcomePresenter: WelcomePresenterInterface {
    
    func viewDidDisappear(animated: Bool) {
        
        view.resetFields()
    }
    
    func didSelectInitGame(with firstUser: String?, secondUser: String?) {
        guard let firstUser = firstUser, !firstUser.isEmpty, let secondUser = secondUser, !secondUser.isEmpty else {
            showInvalidUsersError()
            return
        }
        
        wireframe.navigate(to: .game(firstUser, secondUser))
    }
    
    func didSelectShowResults() {
        wireframe.navigate(to: .results)
    }
    
    private func showInvalidUsersError() {
        wireframe.showErrorAlert(with: "Enter valid users")
    }
}
