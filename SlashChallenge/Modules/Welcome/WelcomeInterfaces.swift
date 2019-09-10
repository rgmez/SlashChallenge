//
//  WelcomeInterfaces.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//
//

import UIKit

enum WelcomeNavOption {
    case game(String, String)
    case results
}

protocol WelcomeWireframeInterface: WireframeInterface {
    func navigate(to option: WelcomeNavOption)
}

protocol WelcomeViewInterface: ViewInterface {
    func resetFields()
}

protocol WelcomePresenterInterface: PresenterInterface {
    func didSelectInitGame(with firstUser: String?, secondUser: String?)
    func didSelectShowResults()
}

protocol WelcomeInteractorInterface: InteractorInterface {
}
