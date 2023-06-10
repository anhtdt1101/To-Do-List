//
//  ListViewModel.swift
//  To-Do-Something
//
//  Created by Tien Anh Tran Duc on 10/06/2023.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    let itemKey: String = "item.list"
    
    init(){
        self.items = DatabaseManager.getNoteModel().toItems()
    }
    
    func deleteItem(_ index: IndexSet){
        items.remove(atOffsets: index)
    }
    
    func moveItem(_ form: IndexSet, _ to: Int){
        items.move(fromOffsets: form, toOffset: to)
    }
    
    func addItem(_ title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        saveItems(newItem)
        items.append(newItem)
        
    }
    
    func updateItem(_ item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateStatus()
        }
    }
    
    func saveItems(_ item: ItemModel){
        DatabaseManager.addNoteModel(item.toReamlModel())
    }
}
