//
//  Constants.swift
//  CoreNotes
//
//  Created by Kyle Brooks Robinson on 6/23/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import Foundation
import UIKit

// Create a global functon that

let DEBUG = true

let categories: [String:(String,UIColor)] = [

    "Urgent" : ("Red", UIColor(red:0.99, green:0.06, blue:0.31, alpha:1)),
    "Normal" : ("Yellow", UIColor(red:1, green:0.99, blue:0.22, alpha:1)),
    "Casual" : ("Blue", UIColor(red:0.14, green:0.83, blue:0.99, alpha:1)),
    "Pending" : ("Gray", UIColor.grayColor()),
    "Done" : ("Green", UIColor(red:0.43, green:0.91, blue:0.57, alpha:1)),

]

func categoryColor(name: String) -> UIColor {
    
    // That .1 is accessing value[1] in the tuple. (value[0] would be the color string.  Value[1] is the color itself.
    return categories[name]!.1
    
}











