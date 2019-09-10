//
//  ResultModel.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 05/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import Foundation
import RealmSwift

final class ResultModel: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var firstUser = ""
    @objc dynamic var secondUser = ""
    @objc dynamic var firstScore = 0
    @objc dynamic var secondScore = 0
    @objc dynamic var date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }

    
}

final class ResultData: ResultItemInterface {
    var firstPlayerName: String?
    var secondPlayerName: String?
    var firstPlayerScore: String?
    var secondPlayerScore: String?
    var date: Date?
}
