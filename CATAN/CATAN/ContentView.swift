//
//  ContentView.swift
//  CATAN
//
//  Created by mac on 2020/10/18.
//

import SwiftUI

struct ContentView: View {
    let dice1 = ["1", "2", "3", "4", "5", "6"]
    let dice2 = ["1", "2", "3", "4", "5", "6"]
    let plus = " + "
    let equal = " = "
    @State private var number = " "
    @State private var showSheet = false
    var body: some View {
        VStack {
            if number == "7"{
                Text(number)
                    .font(.system(size: 200))
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            } else {
                Text(number)
                    .font(.system(size: 200))
                    .fontWeight(.bold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            
            Button(action: {
                    self.number = String((Int(self.dice1.randomElement()!)! + Int(self.dice2.randomElement()!)!))
                }) {
                    Text("Dice")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.black)
                        .background(Capsule().foregroundColor(.white))
            }
            Text(" ")
            
            Button(action: {
                self.showSheet.toggle()
            }) {
               Text("Score Sheet")
                .font(.largeTitle)
            }
            .sheet(isPresented: $showSheet){
                MySheet()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            MySheet()
        }
    }
}

struct MySheet: View{
    var body: some View {
        ZStack {
            Color.white
            Text("Score")
                .font(.largeTitle)
        }
    }
}
