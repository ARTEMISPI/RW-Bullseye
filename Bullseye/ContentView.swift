//
//  ContentView.swift
//  Bullseye
//
//  Created by Artemis Papunidis on 28.11.20.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50
    @State var target: Int = Int.random(in: 1...100)
    
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
                var roundedValue: Int = Int (sliderValue.rounded())
                return Alert (title: Text ("WOW!"), message: Text ("The slider's value is \(roundedValue). \n" +
                "You scored \(pointsForCurrentSession()) points this round"
                ), dismissButton: .default(Text ("Ok")))
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
            Text ("99999")
                Spacer()
            Text ("Round")
            Text ("999")
                Spacer()
                Button(action: {}, label: {
                Text ("Info")
            })
            }
            .padding(.bottom, 20)
            
            
  
            }
        }
    func pointsForCurrentSession() -> Int {
        var difference: Int
        var roundedValue = Int (sliderValue.rounded())
        
        if roundedValue > target {
            difference = roundedValue - target
            return difference
        } else if roundedValue < target {
            difference = target - roundedValue
            return difference
        } else {
            difference = 0
        }
        
        var awardedPoint: Int = 100 - difference
        
        return awardedPoint
    }
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
