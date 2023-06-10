//
//  EmptyView.swift
//  To-Do-Something
//
//  Created by Tien Anh Tran Duc on 10/06/2023.
//

import SwiftUI

struct EmptyView: View {
    
    @State var animate: Bool = false
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                Text("There are no items!!!!").font(.title).fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your to do list!")
                NavigationLink(destination: AddView(), label: {
                    Text("Add Something!").foregroundColor(.white)
                        .frame(height: 56)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : Color.accentColor)
                        .cornerRadius(10)
                }).padding(.horizontal, animate ? 30 : 50)
                    .padding(.top, 12)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -10 : 0)
                    .shadow(
                        color: animate ? Color.red.opacity(0.5) : Color.accentColor.opacity(0.5),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
            }.multilineTextAlignment(.center).padding(40)
                .onAppear(perform: addAnimation)
        }.frame(width: .infinity, height: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(.easeOut(duration: 2).repeatForever()){
                animate.toggle()
            }
            
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EmptyView().navigationTitle("Title")
        }
    }
}
