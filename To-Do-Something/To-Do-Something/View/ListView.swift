//
//  ListView.swift
//  To-Do-Something
//
//  Created by Tien Anh Tran Duc on 10/06/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                EmptyView().transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List{
                    if listViewModel.items.isEmpty{
                        EmptyView()
                    } else{
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item).onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item)
                                }
                            }
                        }.onDelete(perform: listViewModel.deleteItem)
                            .onMove(perform: listViewModel.moveItem)
                    }
                }
            }
        }.navigationTitle("Todo List")
            .listStyle(.plain)
            .navigationBarItems(leading: EditButton(),
                                trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
    }
}
