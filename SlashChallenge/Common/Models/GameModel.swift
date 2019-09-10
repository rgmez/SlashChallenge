//
//  GameModel.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import Foundation

struct GameModel {
    let firstUser: String
    let secondUser: String
    var firstScore: Int
    var secondScore: Int
    let questions: [QuestionModel]
}
