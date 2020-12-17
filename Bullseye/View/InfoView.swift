//
//  InfoView.swift
//  Bullseye
//
//  Created by Artemis Papunidis on 17.12.20.
//

import SwiftUI

struct InfoView: View {
    
let brownColor = Color(red: 255/255, green: 214/255, blue: 179/255)
    
//MARK: Modifiers

struct HeadingStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
        .foregroundColor(.black)
        .font(.custom("Arial Rounded MT Bold", size: 30))
        .padding(.bottom, 20)
        .padding(.top, 20)
    }
}
    
struct BodyStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
        .foregroundColor(.black)
        .font(.custom("Arial Rounded MT Bold", size: 16))
        .padding(.bottom, 20)
        .padding(.trailing, 60)
        .padding(.leading, 60)
    }
}

    
var body: some View {
  VStack {
      Text("🎯 Welcome to Bullseye 🎯").modifier(HeadingStyle())
        VStack {
          Text("That's a whole new world of gaming and achieving new experience.")
          Text("In this game you should drag the slider as close as you can to the target value.")
          Text("Then you can collect your points for each succesfull shot and compare your result with friends!")
          Text("Have fun and be like a Hawkeye!")
    }
        .modifier(BodyStyle())
        .lineLimit(nil)
}
  .background(brownColor)
  .background(Image("Background"))
  .navigationBarTitle("About Bullseye")
  .multilineTextAlignment(.center)
}
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView().previewLayout(.fixed(width: 896, height: 414))
}
}
