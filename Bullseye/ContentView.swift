//
//  ContentView.swift
//  Bullseye
//
//  Created by Artemis Papunidis on 28.11.20.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var alertIsVenom: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                    print ("Spider-man joke")
                    alertIsVenom = true
            })
            {
                Text ("Well, hello boeee!")
            }
            .alert(isPresented: $alertIsVenom, content: { () -> Alert in
                return Alert (title: Text ("Who's there?)"), message: Text ("It's ur uncle Ben, Pit!"), dismissButton: .default(Text ("That's not funny, Venom!")))
            })
            
            Text("This is something")
                .fontWeight(.heavy)
                .padding()
                .foregroundColor(.red)
                
            Button(action: {
                print ("someone tapped me!!!!")
                alertIsVisible = true
            })
            {
                Text ("Hit me")
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert (title: Text ("Warning!"), message: Text ("This is a pop-up"), dismissButton: .default(Text ("Gotcha")))
            }
            }
        }
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
