//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Artemis Papunidis on 11.02.21.
//

import SwiftUI

//MARK: - VIEWS
struct RoundedImageViewStroked: View {
    
    var systemName: String
    
    var body: some View {
       Image(systemName: systemName)
        .font(.title)
        .foregroundColor(Color("TextColor"))
        .frame(width: 56.0, height: 56.0)
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
        .frame(width: 56.0, height: 56.0)
        .background(
        Circle()
            .fill(Color("ButtonFilledBackgroundColor"))
        )
    }
}

struct RoundedRectTextView: View {
    
    var text: String
    
    var body: some View {
       Text(text)
        .kerning(-0.2)
        .bold()
        .font(.title3)
        .frame(width: 68.0, height: 56.0)
        .foregroundColor(Color("TextColor"))
        overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .stroke(lineWidth: 2.0)
                .foregroundColor(Color("ButtonStrokeColor"))
        )
    }
}

//MARK: - VIEWS SET
struct PreviewView: View {
    
    var body: some View {
        VStack (spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectTextView(text: "100")
        }
    }
}


//MARK: - PREVIEWS
struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
          .preferredColorScheme(.dark)
    }
}
