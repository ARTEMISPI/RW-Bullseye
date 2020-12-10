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
    
    //MARK: Interface
    
    var body: some View {
        VStack {
                Spacer()
    //Target row
    HStack {
        Text("Put the slider closer you can to:")
        Text("\(target)")
    }
        Spacer()
            
    //Slider row
    HStack {
        Text ("1")
        Slider(value: $sliderValue, in: 1...100)
        Text ("100")
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
        return Alert (title: Text ("\(howWellPlayed())"), message: Text ("The slider's value is \(sliderValueRounded()). \n" +
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
            
        }, label: {
            Text("Try again")
        })
        Spacer()
    Text ("Score")
    Text ("\(score)")
        Spacer()
    Text ("Round")
    Text ("\(round)")
        Spacer()
    Button(action: {}, label: {
    Text ("Info")
    })
    }
    .padding(.bottom, 20)

            }
        }
    
//MARK: Methods
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func pointsForCurrentSession() -> Int {
       100 - abs(target - sliderValueRounded())
    }
    
    func howWellPlayed() -> String {
        var title: String = ""
        if pointsForCurrentSession()>90 {
            title = "Great job!"
        } else if pointsForCurrentSession()>50 {
            
        } else if pointsForCurrentSession()<5 {
            
        }
        return title
    }
    
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
