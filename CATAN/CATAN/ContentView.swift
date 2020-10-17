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
    var body: some View {
        VStack {
            Button(action: {
                    self.number = String((Int(self.dice1.randomElement()!)! + Int(self.dice2.randomElement()!)!))
                }) {
                    Text("Dice")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.black)
                        .background(Capsule().foregroundColor(.gray))
                    }
        
            if number == "7"{
                Text(number)
                    .font(.system(size: 150))
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            } else {
                Text(number)
                    .font(.system(size: 150))
                    .fontWeight(.bold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
