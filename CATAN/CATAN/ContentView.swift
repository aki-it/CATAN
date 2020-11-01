//
//  ContentView.swift
//  CATAN
//
//  Created by mac on 2020/10/18.
//

import SwiftUI
import UserNotifications
import AudioToolbox
import Combine


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
    
    // reset
    func reset1() {
        value1 = 0
    }
    
    func reset2() {
        value2 = 0
    }
    
    func reset3() {
        value3 = 0
    }
    
    func reset4() {
        value4 = 0
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
                
                var soundIdRing:SystemSoundID = 1022
                if let soundUrl = CFBundleCopyResourceURL(CFBundleGetMainBundle(), nil, nil, nil){
                    AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
                    AudioServicesPlaySystemSound(soundIdRing)
                }
                
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
                .font(.system(size: 30))
                .background(colors[0])
                    
                Stepper(onIncrement: incrementStep2,
                    onDecrement: decrementStep2) {
                    Text("Score: \(value2) ")
                }
                .padding(10)
                .font(.system(size: 30))
                .background(colors[1])
                    
                Stepper(onIncrement: incrementStep3,
                    onDecrement: decrementStep3) {
                    Text("Score: \(value3) ")
                }
                .padding(10)
                .font(.system(size: 30))
                .background(colors[2])
                    
                Stepper(onIncrement: incrementStep4,
                    onDecrement: decrementStep4) {
                    Text("Score: \(value4) ")
                }
                .padding(10)
                .font(.system(size: 30))
                .background(colors[3])
            
            }
            
            //score reset
            VStack {
                
                Button(action: {
                    reset1()
                    reset2()
                    reset3()
                    reset4()
                }) { Text("Reset")
                    .font(.system(size: 40))
                    .foregroundColor(.red)
                    
                }
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



struct MySheet: View {
    @State private var value1 = 0
    @State private var value2 = 0
    @State private var value3 = 0
    @State private var value4 = 0
    var allscore1 :[Int] = [0,1,2,3,4,5,6,7,8,9,10]
    var allscore2 :[Int] = [0,1,2,3,4,5,6,7,8,9,10]
    var allscore3 :[Int] = [0,1,2,3,4,5,6,7,8,9,10]
    var allscore4 :[Int] = [0,1,2,3,4,5,6,7,8,9,10]
    
    //inc dec funcs
    func incrementStep1() {
        value1 += 1
        if value1 >= allscore1.count { value1 = 0 }
    }

    func decrementStep1() {
        value1 -= 1
        if value1 < 0 { value1 = allscore1.count - 1 }
    }
    
    func incrementStep2() {
        value2 += 1
        if value2 >= allscore2.count { value2 = 0 }
    }

    func decrementStep2() {
        value2 -= 1
        if value2 < 0 { value2 = allscore2.count - 1 }
    }
    
    func incrementStep3() {
        value3 += 1
        if value3 >= allscore3.count { value3 = 0 }
    }

    func decrementStep3() {
        value3 -= 1
        if value3 < 0 { value3 = allscore3.count - 1 }
    }
    
    func incrementStep4() {
        value4 += 1
        if value4 >= allscore4.count { value4 = 0 }
    }

    func decrementStep4() {
        value4 -= 1
        if value4 < 0 { value4 = allscore4.count - 1 }
    }
    
    //allscore
    @State private var allscorevalue1 = 0
    var body: some View {
        HStack {
            Text("History")
                .font(.system(size: 30))
        }
        
        // add list
        List{
            Stepper(onIncrement: incrementStep1,
                onDecrement: decrementStep1) {
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                Text("wins: \(value1) ")
            }
            .padding(10)
            .font(.system(size: 30))
            
            Stepper(onIncrement: incrementStep2,
                onDecrement: decrementStep2) {
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                Text("wins: \(value2) ")
            }
            .padding(10)
            .font(.system(size: 30))
            
            Stepper(onIncrement: incrementStep3,
                onDecrement: decrementStep3) {
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                Text("wins: \(value3) ")
            }
            .padding(10)
            .font(.system(size: 30))
            
            Stepper(onIncrement: incrementStep4,
                onDecrement: decrementStep4) {
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                Text("wins: \(value4) ")
            }
            .padding(10)
            .font(.system(size: 30))
            
        }

    }
}
