//
//  Structs.swift
//  Zensei
//
//  Created by Shendy Aditya Syamsudin on 12/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

struct Meditation {
    var id : String!
    var title: String!
    var icon: String!
    var type: Int!
    var detail: [DetailMeditation]?
}

struct WeeklyProgress {
    var day: String
    var time: Int
}


struct DetailContent {
    var title: String
    var content: [String]
    var isNumbered: Bool? = false
}

struct DetailMeditation {
     var title: String!
     var desc: [String]!
     var isOpen: Bool!
}

var min = 0
var minSum = [0, 0, 0, 0, 0, 0, 0, 0]
var sesi = 0
