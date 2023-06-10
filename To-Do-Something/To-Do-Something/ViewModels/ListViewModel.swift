//
//  ListViewModel.swift
//  To-Do-Something
//
//  Created by Tien Anh Tran Duc on 10/06/2023.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemKey: String = "item.list"
    
    init(){
        getItem()
    }
    
    func getItem() {
        if let data = UserDefaults.standard.data(forKey: itemKey){
           if let savedData = try? JSONDecoder().decode([ItemModel].self, from: data){
               self.items = savedData
            }
        }
    }
    
    func deleteItem(_ index: IndexSet){
        items.remove(atOffsets: index)
    }
    
    func moveItem(_ form: IndexSet, _ to: Int){
        items.move(fromOffsets: form, toOffset: to)
    }
    
    func addItem(_ title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(_ item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateStatus()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
