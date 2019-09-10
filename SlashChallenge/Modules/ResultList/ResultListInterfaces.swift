//
//  ResultListInterfaces.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 05/09/2019.
//  Copyright (c) 2019 WembleyStudios. All rights reserved.
//

import UIKit

protocol ResultListWireframeInterface: WireframeInterface {
}

protocol ResultListViewInterface: ViewInterface {
    func reloadData()
    func setViewTitle(_ title: String?)
}

protocol ResultListPresenterInterface: PresenterInterface {
    func numberOfSections() -> Int
    func numberOrItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> ResultItemInterface
    func heightForRow() -> CGFloat
}

protocol ResultListInteractorInterface: InteractorInterface {
    func getResults() -> [ResultData]?
}

protocol ResultItemInterface {
    var firstPlayerName: String? { get }
    var secondPlayerName: String? { get }
    var firstPlayerScore: String? { get }
    var secondPlayerScore: String? { get }
    var date: Date? { get }
}
