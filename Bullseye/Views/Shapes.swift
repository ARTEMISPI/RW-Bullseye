//
//  Shapes.swift
//  Bullseye
//
//  Created by Artemis Papunidis on 10.02.21.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack {
            Circle()
                .strokeBorder(Color.blue, lineWidth: 20.0)
                .frame(width: 200, height: 100, alignment: .center)
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
