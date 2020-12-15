//
//  ContentView.swift
//  Bullseye
//
//  Created by Artemis Papunidis on 28.11.20.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: States
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    //MARK: Modifiers
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(.white)
                .font(.custom("Arial Rounded MT Bold", size: 20))
                .shadow(color: .black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.custom("Arial Rounded MT Bold", size: 24))
                .foregroundColor(.yellow)
                .modifier(LabelStyle())
        }
    }
    
    //MARK: Interface
    
    var body: some View {
        VStack {
                Spacer()
    //Target row
    HStack {
        Text("Put the slider closer you can to:").modifier(LabelStyle())
        Text("\(target)").modifier(ValueStyle())
    }
        Spacer()
            
    //Slider row
    HStack {
        Text ("1").modifier(LabelStyle())
        Slider(value: $sliderValue, in: 1...100)
        Text ("100").modifier(LabelStyle())
    }
        Spacer()
            
    //Buttton row
    Button(action: {
        print ("someone tapped me!!!!")
        alertIsVisible = true
    })
    {
        Text ("Hit me")
    }
    .alert(isPresented: $alertIsVisible) { () ->
        Alert in
        return Alert (title: Text (alertTitle()), message: Text ("The slider's value is \(sliderValueRounded()). \n" +
        "You scored \(pointsForCurrentSession()) points this round"
        ), dismissButton: .default(Text ("Ok")){
            score = score + pointsForCurrentSession()
            target = Int.random(in: 1...100)
            round = round + 1
        })
    }
        Spacer()
            
    //Score row
    HStack {
        Button(action: {
            greatReset()
        }, label: {
            Text("Reset")
        })
        Spacer()
    Text ("Score:").modifier(LabelStyle())
    Text ("\(score)").modifier(ValueStyle())
        Spacer()
        Text ("Round:").modifier(LabelStyle())
    Text ("\(round)").modifier(ValueStyle())
        Spacer()
    Button(action: {}, label: {
    Text ("Info")
    })
    }
    .padding(.bottom, 20)
            }
        .background(Image("Background"), alignment: .center)
    }
    
//MARK: Methods
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amauntOff() -> Int {
        abs(target - sliderValueRounded())
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
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
