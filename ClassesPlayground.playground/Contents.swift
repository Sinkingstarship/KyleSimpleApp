//: Playground - noun: a place where people can play

import UIKit

enum Sex {
    case Male
    case Female
}

enum EyeColor {
    case Blue
    case Green
    case Gray
    case Brown
}


class Human {
    
    var sex: Sex
    var age: Int
    var nationality: String
    var height: String
    var skinColor: String
    var hairColor: String
    var eyeColor: EyeColor
    var isLeftHanded: Bool = false
    
    init(sex: Sex, age: Int, nationality: String, height: String, skinColor: String, hairColor: String, eyeColor: EyeColor) {
        self.sex = sex
        self.age = age
        self.nationality = nationality
        self.height = height
        self.skinColor = skinColor
        self.hairColor = hairColor
        self.eyeColor = eyeColor
        
    }
    
}

var leah = Human(sex: .Female, age: 22, nationality: "Brazilian", height: "5 foot 6 inches", skinColor: "White", hairColor: "Orange", eyeColor: .Brown)

enum CupSize {
    case A
    case B
    case C
    case D
    case DD
}


//class Leticia: Human {
//    
//    var bodyType: String
//    var boobs: CupSize
//    var cutenessLevel: Int
//    var wearsGlasses: Bool
//    
//    init (wearsGlasses: Bool) {
//        self.wearsGlasses = wearsGlasses
//        super.init(sex: sex, age: age, nationality: nationality, height: height, skinColor: skinColor, hairColor: hairColor, eyeColor: eyeColor)
//    }
//    
//    convenience init (sex: .Female, age: 22)
//    
//    
//}

var num1: Int?
var num2: Int?

num1 = 4

num1!
num2!

if num1 != nil {num1!}
if num2 != nil {num2!}


class Mouth {
    var lipsColor: UIColor!
    var teethCount: Int!
    
    init(teeth: Int, lips: UIColor) {
        teethCount = teeth
        lipsColor = lips
    }
    
    func chewFood(food: AnyObject) {
        println("You just chewed some \(food).")
    }
    
    func yawn() {
        println("You just yawned.")
    }
}

// Homework!

//Create a playground












