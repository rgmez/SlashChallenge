//
//  ResultListPresenter.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 05/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//

import UIKit

final class ResultListPresenter {

    // MARK: - Private properties -

    private unowned let view: ResultListViewInterface
    private let interactor: ResultListInteractorInterface
    private let wireframe: ResultListWireframeInterface
    
    private var results: [ResultData] = [] {
        didSet {
            view.reloadData()
        }
    }

    // MARK: - Lifecycle -

    init(view: ResultListViewInterface, interactor: ResultListInteractorInterface, wireframe: ResultListWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension ResultListPresenter: ResultListPresenterInterface {
    
    func viewDidLoad() {
        if let res = interactor.getResults() {
            results = res
        }
        
        view.setViewTitle("ResultList.ResultHistory.title".localized)
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOrItems(in section: Int) -> Int {
        return results.count
    }
    
    func item(at indexPath: IndexPath) -> ResultItemInterface {
        return results[indexPath.row]
    }
    
    func heightForRow() -> CGFloat {
        return 100.0
    }
}
