//
//  AddView.swift
//  To-Do-Something
//
//  Created by Tien Anh Tran Duc on 10/06/2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here ...", text: $textFText)
                    .padding(.horizontal)
                    .frame(height: 56)
                    .border(.gray,width: 0.5)
                Button (action: didSelectSave, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50).frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                
            }.padding(14)
        }.navigationTitle("Add an item")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func didSelectSave(){
        if validate() {
          
            listViewModel.addItem(textFText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func validate() -> Bool{
        if textFText.count < 3 {
            alertTitle = "Your new todo must be at least 3 characters long!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
    }
}
