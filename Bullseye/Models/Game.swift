//
//  Game.swift
//  Bullseye
//
//  Created by Artemis Papunidis on 21.01.21.
//

import Foundation

struct Game {
//    var sliderValue = 50.0
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        100 - abs(target - sliderValue)
    }
}
