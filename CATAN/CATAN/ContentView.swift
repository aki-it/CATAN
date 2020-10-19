//
//  ContentView.swift
//  CATAN
//
//  Created by mac on 2020/10/18.
//

import SwiftUI
import UserNotifications


struct ContentView: View {
    
    //Dice pattern
    let dice1 = ["1", "2", "3", "4", "5", "6"]
    let dice2 = ["1", "2", "3", "4", "5", "6"]
    let plus = " + "
    let equal = " = "
    @State private var number = " "
    @State private var showSheet = false
    
    //score
    @State private var value1 = 0
    @State private var value2 = 0
    @State private var value3 = 0
    @State private var value4 = 0
    var score1 :[Int] = [0,1,2,3,4,5,6,7,8,9,10]
    var score2 :[Int] = [0,1,2,3,4,5,6,7,8,9,10]
    var score3 :[Int] = [0,1,2,3,4,5,6,7,8,9,10]
    var score4 :[Int] = [0,1,2,3,4,5,6,7,8,9,10]

    //color pattern
    let colors: [Color] = [.red, .green, .blue, .yellow]

    //inc dec funcs
    func incrementStep1() {
        value1 += 1
        if value1 >= score1.count { value1 = 0 }
    }

    func decrementStep1() {
        value1 -= 1
        if value1 < 0 { value1 = score1.count - 1 }
    }
    
    func incrementStep2() {
        value2 += 1
        if value2 >= score2.count { value2 = 0 }
    }

    func decrementStep2() {
        value2 -= 1
        if value2 < 0 { value2 = score2.count - 1 }
    }
    
    func incrementStep3() {
        value3 += 1
        if value3 >= score3.count { value3 = 0 }
    }

    func decrementStep3() {
        value3 -= 1
        if value3 < 0 { value3 = score3.count - 1 }
    }
    
    func incrementStep4() {
        value4 += 1
        if value4 >= score4.count { value4 = 0 }
    }

    func decrementStep4() {
        value4 -= 1
        if value4 < 0 { value4 = score4.count - 1 }
    }
    
    var body: some View {
        VStack {
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
            
            Button(action: {
                
                let content = UNMutableNotificationContent()
                content.sound = UNNotificationSound.default
                
                self.number = String((Int(self.dice1.randomElement()!)! + Int(self.dice2.randomElement()!)!))
                }
            ) {
                    Text("Dice")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.black)
                        .background(Rectangle().foregroundColor(.white))
            }
            List{
                Stepper(onIncrement: incrementStep1,
                    onDecrement: decrementStep1) {
                    Text("Score: \(value1) ")
                }
                .padding(10)
                .font(.system(size: 20))
                .background(colors[0])
                    
                Stepper(onIncrement: incrementStep2,
                    onDecrement: decrementStep2) {
                    Text("Score: \(value2) ")
                }
                .padding(10)
                .font(.system(size: 20))
                .background(colors[1])
                    
                Stepper(onIncrement: incrementStep3,
                    onDecrement: decrementStep3) {
                    Text("Score: \(value3) ")
                }
                .padding(10)
                .font(.system(size: 20))
                .background(colors[2])
                    
                Stepper(onIncrement: incrementStep4,
                    onDecrement: decrementStep4) {
                    Text("Score: \(value4) ")
                }
                .padding(10)
                .font(.system(size: 20))
                .background(colors[3])
            
            }
            
            //history
            Button(action: {
                self.showSheet.toggle()
            }) {
                Text("History")
                    .font(.caption)
            }
            .sheet(isPresented: $showSheet) {
                MySheet()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct MySheet: View {
    var body: some View {
        ZStack {
            Text("test")
                .font(.caption)
        }
    }
}
