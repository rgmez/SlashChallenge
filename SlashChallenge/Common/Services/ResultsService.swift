//
//  ResultsService.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 05/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import Foundation
import RealmSwift

final class ResultService: BaseRealmService {
    
    class func addNewGameResult(gameResult: GameModel) {
        let result = ResultModel()
        result.id = ResultService.incrementID()
        result.firstUser = gameResult.firstUser
        result.firstScore = gameResult.firstScore
        result.secondUser = gameResult.secondUser
        result.secondScore = gameResult.secondScore
        result.date = Date()
        
        saveObject(object: result)
    }
    
    class func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(ResultModel.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    class func retrieveAllResults() -> [ResultModel]? {
        return getObjects()
    }
    
    class func getResults() -> [ResultData]? {
        return ResultService.retrieveAllResults()?.compactMap {
            let data = ResultData()
            data.firstPlayerName = $0.firstUser
            data.firstPlayerScore = "\($0.firstScore)"
            data.secondPlayerName = $0.secondUser
            data.secondPlayerScore = "\($0.secondScore)"
            data.date = $0.date
            return data
        }
    }
    
    class func getGame(with identifier: Int) -> ResultModel? {
        do {
            let realm = try Realm()
            let predicate = NSPredicate(format: "id = %d", identifier)
            let models = realm.objects(ResultModel.self).filter(predicate)
            
            if let item = models.first {
                return item
            }
            
        } catch {
            debugPrint(error.localizedDescription)
        }
        
        return nil
    }
    
    class func delete(with identifier: Int) {
        if let game = getGame(with: identifier) {
            deleteObject(object: game)
        }
    }
}
