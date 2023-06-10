//
//  ItemsModel.swift
//  To-Do-Something
//
//  Created by Tien Anh Tran Duc on 10/06/2023.
//

import Foundation

class ItemModel: Identifiable{
    let title: String
    let isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func toReamlModel() -> RNoteModel{
        let rNote = RNoteModel()
        rNote.isCompleted = isCompleted
        rNote.title = title
        return rNote
    }
    
    func updateStatus() -> ItemModel{
        return ItemModel(title: title, isCompleted: !isCompleted)
    }
    
}


