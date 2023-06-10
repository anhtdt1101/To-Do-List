//
//  RNoteModel.swift
//  To-Do-Something
//
//  Created by Tien Anh Tran Duc on 10/06/2023.
//

import Foundation
import RealmSwift

class RNoteModel: Object{
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var title: String = ""
    @objc dynamic var isCompleted: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }

    func toItemsModel() -> ItemModel{
        return ItemModel(title: title, isCompleted: isCompleted)
    }
}

extension Array where Element: RNoteModel{
    func toItems() -> [ItemModel]{
        var res: [ItemModel] = []
        self.forEach { note in
            res.append(note.toItemsModel())
        }
        return res
    }

}
