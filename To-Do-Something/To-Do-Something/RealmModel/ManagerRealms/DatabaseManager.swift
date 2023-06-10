//
//  DatabaseManager.swift
//  BaBa Manager
//
//  Created by Tien Anh Tran Duc on 18/08/2022.
//

import Foundation
import RealmSwift

class DatabaseManager: NSObject {
    static func addNoteModel(_ data: RNoteModel,callback: ((Bool) -> Void)? = nil){
        let realm = RealmServices.shared.diskRealm
        let channels = realm.objects(RNoteModel.self).compactMap({ $0 })
        do {
            try realm.write {
                realm.add(data.self, update: .all)
                callback?(true)
            }
        } catch {
            debugPrint(error.localizedDescription)
            callback?(false)
        }
    }
    
    static func getNoteModel() -> [RNoteModel] {
        let realm = RealmServices.shared.diskRealm
        let objects = realm.objects(RNoteModel.self)
        return Array(objects)
    }
}



