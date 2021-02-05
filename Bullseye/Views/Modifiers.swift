//
//  Modifiers.swift
//  Bullseye
//
//  Created by Artemis Papunidis on 3.02.21.
//

import SwiftUI

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
        //                .shadow(color: .black, radius: 20, x: 2, y: 2)
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

struct InstructionTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading, 30.0)
            .padding(.trailing, 30.0)
    }
}

struct BigNumberTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
//            .kerning(-1.0)
            .modifier(TargetValueStyle())
            .foregroundColor(Color("TextColor"))
    }
}
