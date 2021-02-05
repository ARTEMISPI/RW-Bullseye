//
//  ContentView.swift
//  Bullseye
//
//  Created by Artemis Papunidis on 28.11.20.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - STATES
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    @State private var target = Int.random(in: 1...100)
    @State private var score = 0
    @State private var round = 1
    
    let strangeBlue = Color(red: 47/255, green: 50/255, blue: 107/255)
    
    //MARK: - INTERFACE
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    InstructionView(game: $game)
                    SliderView(sliderValue: $sliderValue)
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                }
                Spacer()
            
                Spacer()
                
                //SCORE ROW
                HStack {
                    //RESET BUTTON
                    Button(action: {
                        greatReset()
                    }, label: {
                        HStack {
                            Image("ResetIcon")
                            Text("Reset").modifier(ButtonSmallTextStyle())
                        }
                    })
                    .background(Image("Button"), alignment: .center)
                    .modifier(ShadowStyle())
                    Spacer()
                    //SCORE TEXT
                    Text ("Score:").modifier(LabelStyle())
                    Text ("\(score)").modifier(ValueStyle())
                    Spacer()
                    //ROUND TEXT
                    Text ("Round:")
                        .modifier(LabelStyle())
                    Text ("\(round)").modifier(ValueStyle())
                    Spacer()
                    //INFO BUTTON
                    NavigationLink (destination: InfoView()) {
                        HStack {
                            Image("InfoIcon")
                            Text ("Info").modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button"), alignment: .center).modifier(ShadowStyle())
                }
                .padding(.bottom, 20)
            }
            //        .background(Image("Background"), alignment: .center)
            .accentColor(strangeBlue)
            .navigationBarTitle("Bullseye")
        }
    }
    
    
    //MARK: - METHODS
//    func roundedValue() -> Int {
//        Int(sliderValue.rounded())
//    }
    
//    func amauntOff() -> Int {
//        abs(target - roundedValue())
//    }
//
//    func pointsForCurrentSession() -> Int {
//        let maximumScore = 100
//        let difference = amauntOff()
//        let bonus: Int
//
//        if difference == 0 {
//            bonus = 100
//        } else if difference == 1 {
//            bonus = 50
//        } else if difference == 5 {
//            bonus = 25
//        } else {
//            bonus = 0
//        }
//        return maximumScore - difference + bonus
//    }
//    
//    
//    func alertTitle() -> String {
//        let title: String
//        
//        if amauntOff() == 0 {
//            title = "Perfect! Take your extra 100 points"
//        } else if amauntOff() <= 1 {
//            title = "Wow! Extra 50 points just for this shoot"
//        } else if amauntOff() <=  5 {
//            title = "Cool! Extra 25 points you earned"
//        } else if amauntOff() <= 10 {
//            title = "Not bad!"
//        } else if amauntOff() <= 25 {
//            title = "Try to be more accurate"
//        } else {
//            title = "Do you even want to play?!"
//        }
//        return title
//    }
    
    func greatReset() {
        sliderValue = 50.0
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
    
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewLayout(.fixed(width: 896, height: 414))
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 896, height: 414))
        }
    }
}
