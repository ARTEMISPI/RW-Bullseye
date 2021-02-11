//
//  TextViews.swift
//  Bullseye
//
//  Created by Artemis Papunidis on 3.02.21.
//

import SwiftUI

//MARK: - VIEW
struct InstructionText: View {
    
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .modifier(TargetValueStyle())
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct HitMeButton: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            print ("Button tapped")
            alertIsVisible = true
        })
        {
            Text ("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
                .padding(20.0)
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                            
                    })
                .foregroundColor(.white)
                .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        .alert(isPresented: $alertIsVisible, content: {
            let roundedValue = Int(sliderValue.rounded())
                    return Alert(title: Text("Hey!"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round."), dismissButton: .default(Text("Dismiss")))
        })
    }
}



//MARK: - VIEWS
struct InstructionView: View {
    
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the slider closer you can to")
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

//MARK: - PREVIEW
struct TextViews_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "Big Number")
            SliderLabelText(text: "1 and 100")
        }
    }
}
