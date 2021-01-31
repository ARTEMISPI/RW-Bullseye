//
//  ContentView.swift
//  Bullseye
//
//  Created by Artemis Papunidis on 28.11.20.
//

import SwiftUI

struct ContentView: View {
    
//MARK: STATES
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    @State private var target = Int.random(in: 1...100)
    @State private var score = 0
    @State private var round = 1
    
    let strangeBlue = Color(red: 47/255, green: 50/255, blue: 107/255)
    
//MARK: MODIFIERS
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(.white)
                .font(.custom("Arial Rounded MT Bold", size: 20))
                .shadow(color: .black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct TargetValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.largeTitle)
                .foregroundColor(.yellow)
                .modifier(ShadowStyle())
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.custom("Arial Rounded MT Bold", size: 24))
                .foregroundColor(.yellow)
                .modifier(ShadowStyle())
        }
    }
    
    struct ShadowStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .shadow(color: .black, radius: 20, x: 2, y: 2)
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(.black)
                .font(.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(.black)
                .font(.custom("Arial Rounded MT Bold", size: 14))
        }
    }
    
//MARK: INTERFACE
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                    Spacer()
        //TARGET TEXT
        HStack {
            Text("Put the slider closer you can to".uppercased())
                .modifier(LabelStyle())
            
        }
                Text(String(game.target))
                    .kerning(-1.0)
                    .modifier(TargetValueStyle())
            Spacer()
                
        //SLIDER
        HStack {
            Text ("1").modifier(LabelStyle())
            Slider(value: $sliderValue, in: 1...100).accentColor(.accentColor)
            Text ("100").modifier(LabelStyle())
        }
            Spacer()
                
        //HIT ME BUTTON
        Button(action: {
            print ("someone tapped me!!!!")
            alertIsVisible = true
        })
        {
            Text ("Hit me".uppercased())
    //            .modifier(ButtonLargeTextStyle())
                .font(.title3)
            
        }
        .padding(20.0)
        .background(ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.4), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(.white)
        .cornerRadius(21.0)
        .alert(isPresented: $alertIsVisible) { () ->
            Alert in
            return Alert (title: Text (alertTitle()), message: Text ("The slider's value is \(roundedValue()). \n" +
            "You scored \(pointsForCurrentSession()) points this round"
            ), dismissButton: .default(Text ("Ok")){
                score = score + pointsForCurrentSession()
                target = Int.random(in: 1...100)
                round = round + 1
            })
        }
    //    .background(Image("Button"), alignment: .center).modifier(ShadowStyle())
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
            .background(Image("Button"), alignment: .center).modifier(ShadowStyle())
            Spacer()
            //SCORE TEXT
        Text ("Score:").modifier(LabelStyle())
        Text ("\(score)").modifier(ValueStyle())
            Spacer()
            //ROUND TEXT
        Text ("Round:").modifier(LabelStyle())
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
    
    
//MARK: METHODS
    func roundedValue() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amauntOff() -> Int {
        abs(target - roundedValue())
    }
    
    func pointsForCurrentSession() -> Int {
        let maximumScore = 100
        let difference = amauntOff()
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else if difference == 5 {
            bonus = 25
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    
    func alertTitle() -> String {
        let title: String
        
        if amauntOff() == 0 {
            title = "Perfect! Take your extra 100 points"
        } else if amauntOff() <= 1 {
            title = "Wow! Extra 50 points just for this shoot"
        } else if amauntOff() <=  5 {
            title = "Cool! Extra 25 points you earned"
        } else if amauntOff() <= 10 {
            title = "Not bad!"
        } else if amauntOff() <= 25 {
            title = "Try to be more accurate"
        } else {
            title = "Do you even want to play?!"
        }
        return title
    }
    
    func greatReset() {
        sliderValue = 50.0
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
    
    }
    
//MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewLayout(.fixed(width: 896, height: 414))
        }
    }
}
