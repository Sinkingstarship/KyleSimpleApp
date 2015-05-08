//: Playground - noun: a place where people can play

import UIKit

// Simple, changeable variable of type String
var str = "Hello, playground"


var myFirstName = "Kyle"

enum DenimBrands: String {
    
    case FlatHead = "3005"
    case Samurai = "710"
    case IronHeart = "666"
    case StrikeGold = "5109"
    
}
// Ask Jo about enums with strings, etc. for raw values.



var myFavoriteJeans = DenimBrands.FlatHead

// This is really useful!  REMEMBER!
println(myFavoriteJeans.hashValue)


switch myFavoriteJeans {
    case .FlatHead:
    println("You're wearing the 3005!")
    case .Samurai:
    println("You're wearing the S710XX!")
    case .IronHeart:
    println("You're wearing the IH-666S!")
    case .StrikeGold:
    println("You're wearing the 5105!")
}

// ARRRRAAAAAAYYYYYYSSSSS!!!!!!!!!!!!!!!!!!!111!!!!

//ARRAYS ARE a type of collection.

var girlLikes = ["cute", "nerdy", "sweet", "a great body", "glasses", "long hair", "bangs", "skinny jeans"]

girlLikes[0]


for index in 0..<girlLikes.count {
    
    let like = girlLikes[index]
    
    if index <  3 {
        println("I like girls who are \(like).")
    } else {
        println("I like girls who have \(like).")
    }
    
}


// ..< Non-inclusive
// ... inclusive

//DICTIONARIIIIIEEEESSSSSSSS!!!!!!1!!!1!11!!!!!

var myProfile = [
    "name": "Kyle",
    "age": "27",
    "sex": "Yes Please."

]

myProfile["sex"]

var cutieProfile = [
    "name": "Leticia",
    "age": "22",
    "nationality": "Brazilian",
    "height": "5'7\"",
    "weight": "125",
    "eye color": "brown",
    "hair color": "orange",
    "cuteness": "extremely cute",
    "sex": "female"

]

// Iterate through a dictionary!  VERY USEFUL!!

for (key, value) in cutieProfile {
    println("My girl's \(key) is \(value) and she rules.")
}

for num in 0...100 {
    num % 10
}








