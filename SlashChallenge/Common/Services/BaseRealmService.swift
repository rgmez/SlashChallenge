//
//  BaseRealmService.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 05/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import UIKit
import RealmSwift

class BaseRealmService {
    static func saveObject<T:Object>(object: T) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error)
        }
    }
    
    static func deleteObject<T:Object>(object: T) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print(error)
        }
    }
    
    static func getObjects<T:Object>() -> [T]? {
        do {
            let realm = try Realm()
            let realmResults = realm.objects(T.self)
            return Array(realmResults)
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getObjects<T:Object>(filter:String) -> [T]? {
        do {
            let realm = try Realm()
            let realmResults = realm.objects(T.self).filter(filter)
            return Array(realmResults)
        } catch {
            print(error)
            return nil
        }
    }
}
