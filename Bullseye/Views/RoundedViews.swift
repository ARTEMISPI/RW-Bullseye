//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Artemis Papunidis on 11.02.21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    
    var systemName: String
    
    var body: some View {
       Image(systemName: systemName)
        .font(.title)
        .foregroundColor(Color("TextColor"))
        .frame(width: 56, height: 56)
        .overlay(
            Circle()
                .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
        )
    }
}

struct RoundedImageViewFilled: View {
    
    var systemName: String
    
    var body: some View {
       Image(systemName: systemName)
        .font(.title)
        .foregroundColor(Color("ButtonFilledTextColor"))
        .frame(width: 56, height: 56)
        .background(
        Circle()
            .fill(Color("ButtonFilledBackgroundColor"))
        )
//        .background(Circle.fill())
    }
}

struct PreviewView: View {
    var body: some View {
        VStack (spacing: 10) {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
