//
//  Musicians.swift
//  MusicianClass_classes
//
//  Created by Agah Özdemir on 4.02.2023.
//

import Foundation

enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violenist
}

class Musicians {
    
    // Property
    var name : String = ""
    var age : Int = 0
    var instrument : String = ""
    var type : MusicianType
    
    
    // Initilazer
    init(name: String, age: Int, instrument: String, type: MusicianType) {
        self.name = name
        self.age = age
        self.instrument = instrument
        self.type = type
        
        print("Musician Created")
    }
//    init() {
//        print("Musician Created with default Initializer")
//    }
    
    func sing(){
        print("Nothing else matters")
    }
    
    
    private func test() {
        print("test")
    }
    
}

