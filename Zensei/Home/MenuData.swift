//
//  MenuData.swift
//  Zensei
//
//  Created by Shendy Aditya Syamsudin on 12/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
class MenuData {
    
    public static let meditations = [
        Meditation(id: "1", title: "Meditasi 1", icon: "meditasi-1", description: "Meditasi Ini Adalah", type: 1),
        Meditation(id: "2", title: "Meditasi 2", icon: "meditasi-2", description: "Meditasi Ini Adalah", type: 1),
        Meditation(id: "3", title: "Meditasi 3", icon: "meditasi-3", description: "Meditasi Ini Adalah", type: 1),
        Meditation(id: "4", title: "Meditasi 4", icon: "meditasi-4", description: "Meditasi Ini Adalah", type: 1),
        Meditation(id: "5", title: "Meditasi 5", icon: "meditasi-5", description: "Meditasi Ini Adalah", type: 1),
    ]
    
    public static let sounds = [
        Meditation(id: "1", title: "Sound 1", icon: "sound-1", description: "Sound Ini Adalah", type: 2),
        Meditation(id: "2", title: "Sound 2", icon: "sound-2", description: "Sound Ini Adalah", type: 2),
        Meditation(id: "3", title: "Sound 3", icon: "sound-3", description: "Sound Ini Adalah", type: 2),
        Meditation(id: "4", title: "Sound 4", icon: "sound-4", description: "Sound Ini Adalah", type: 2),
        Meditation(id: "5", title: "Sound 5", icon: "sound-5", description: "Sound Ini Adalah", type: 2),
        
    ]
    
    
    
    public static func getMeditation() -> [Meditation]{
        return meditations
    }
    
    
    public static func getSound() -> [Meditation]{
        return sounds
    }
    
    public static func getRecomended() -> [Meditation]{
       
       var recomend = [Meditation]()
        for _ in 1..<3 {
            let randomInt = Int.random(in: 0..<5)
            let randomMeditation = meditations[randomInt]
            let randomSound = sounds[randomInt]
        
            recomend.append(randomMeditation)
            recomend.append(randomSound)
           
        }
        return recomend
    }
    
}
