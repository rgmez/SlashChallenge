//
//  ResultListWireframe.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 05/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//

import UIKit

final class ResultListWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: ResultListViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = ResultListInteractor()
        let presenter = ResultListPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ResultListWireframe: ResultListWireframeInterface {
}
