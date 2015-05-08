//: Playground - noun: a place where people can play

import UIKit

// Welcome... to the Bodypart Playground.

// Make a Class BodyPart
// Make 20 Classes that are BodyParts
// Each class will have 3 properties
// Each class will have 3 methods
// At least 15 methods need to be called from another BodyPart
// At least 10 properties need to be other BodyParts.





class BodyPart {
    var name: String = "A Body Part"
    var isSexy: Bool = true
    var health: String = "Healthy"
    
    func wiggleSelf() {
        println("This body part is now wiggling!")
    }
    
    func showOffSelf() {
        println("You're showing off this body part.")
    }
    
    func hideSelf() {
        println("You're hiding this body part.")
    }
}



class Head: BodyPart {
    
    var hair = Hair()
    var eyes = Eyes()
    var nose = Nose()
    var mouth = Mouth()
    var neck = Neck()
    
    
    func growHair() {
        println("You decided to grow a rock n' roll hairstyle.")
        
        hair.grow()
    }
    
    func lookMirror() {
        println("You're admiring your face in the mirror.")
        
        eyes.look()
    }
    
    func funnyFace() {
        println("You're making a funny face.")
        
        mouth.openMouth()

    }
    
}



class Hair: BodyPart {
    
    var shape: String = "Round"
    var color: UIColor = .blackColor()
    var length: Length = .Medium
    
    enum Length {
        
        case Short
        case Medium
        case Long
    }
    

    
    func checkHair() {
        println("You're checking your hair.")
    }
    
    func funnyFace() {
        println("You're making a funny face.")
    }
    
    func grow() {
        println("You're growing out your hair.")
    }
    
}


class Eyes: BodyPart {
    
    var eyeColor: EyeColor = .Blue
    var mood: Mood = .Happy
    var wearsGlasses: Bool = false
    
    enum EyeColor {
        case Blue
        case Green
        case Brown
        case Gray
    }
    
    enum Mood {
        case Happy
        case Sad
        case Bored
    }

    
    func look() {
        println("You're looking at something.")
    }
    
    func close() {
        println("You're closing your eyes.")
    }
    
    func cry() {
        println("You're crying.")
    }
    
}


class Nose: BodyPart {
    
    var pointiness: Pointiness = .KindaPointy
    var stuffiness: Stuffiness = .ReallyStuffy
    var isItchy: Bool = true
    
    enum Pointiness {
        
        case NotPointy
        case KindaPointy
        case Pointy
    }
    
    enum Stuffiness {
        case NotStuffy
        case KindaStuffy
        case ReallyStuffy
    }
    
    
    
    func blowNose() {
        println("You're blowing your nose.")
        stuffiness = .NotStuffy
    }
    
    func scratchNose() {
        println("You're scratching your nose.")
        isItchy = false
    }
    
    func pickNose() {
        println("You're picking your nose. Weirdo.")
    }
    
}

class Mouth: BodyPart {
    
    var isOpen: Bool = false
    var hasAllTeeth: Bool = true
    var hasBadBreath: Bool = true
    
    
    func openMouth() {
        println("You're opening your mouth.")
        isOpen = true
    }
    
    func smile() {
        println("You're smiling.")
    }
    
    func brushTeeth() {
        println("You're brushing your teeth.")
        hasBadBreath = false
    }
    
}


class Neck: BodyPart {
    
    var head = Head()
    var thickness: Thickness = .KindaThick
    var length: Length = .Medium
    var eyes = Eyes()
    
    enum Length {
        
        case Short
        case Medium
        case Long
    }
    
    enum Thickness {
        case NotThick
        case KindaThick
        case ReallyThick
    }
    
    
    func nod() {
        println("You're nodding.")
        eyes.close()
    }
    
    func lookUp() {
        println("You're looking up.")
    }
    
    func shakeHead() {
        println("You're shaking your head.")
    }
    
}

class Shoulders: BodyPart {
    
    var arms = Arms()
    var wearingShoulderpads: Bool = false
    var touchShoulders: Bool = false
    
    
    func stretch() {
        println("You're stretching your shoulders.")
    }
    
    func equipShoulderpads() {
        println("You're now wearing shoulderpads.")
        wearingShoulderpads = true
    }
    
    func shoulderTouch() {
        println("You're touching your shoulders.")
        touchShoulders = true
        
    }
    
}

class Arms: BodyPart {
    
    var elbows = Elbows()
    var hands = Hands()
    var fingers = Fingers()
    
    
    func bendArm() {
        println("You're bending your arm.")
        elbows.close()
    }
    
    func wave() {
        println("You're waving to a friend.")
        hands.open()
    }
    
    func cross() {
        println("You're crossing your arms.")
        hands.close()
    }
    
}


class Elbows: BodyPart {
    
    var isOpen: Bool = true
    var isPointy: Bool = false
    var hands = Hands()
    
    
    func close() {
        println("You're closing your elbow.")
        isOpen = false
    }
    
    func poke() {
        println("You're poking someone with your elbow.")
    }
    
    func touch() {
        println("You're touching your elbow.")
        hands.touch()
    }
    
}


class Hands: BodyPart {
    
    var isOpen: Bool = false
    var fingers = Fingers()
    var fingernails = Fingernails()
    
    
    func close() {
        println("You're closing your hands.")
        isOpen = false
        fingers.close()
    }
    
    func open() {
        println("You're opening your hands.")
        isOpen = true
        fingers.isOpen = true
    }
    
    func touch() {
        println("You're touching something with your hands.")
    }
    
}

class Fingers: BodyPart {
    
    var isOpen: Bool = false
    var fingernails = Fingernails()
    var isPointing: Bool = false
    
    func point() {
        println("You're your fingers.")
        isPointing = true
    }
    
    func scratch() {
        println("You're scratching something with your finger.")
        fingernails.scratch()
    }
    
    func close() {
        println("You're closing your fingers.")
    }
    
}



class Fingernails: BodyPart {
    
    var length: Length = .Long
    var color: Color = .White
    var isSharp: Bool = false
    
    enum Length {
        case Short
        case Medium
        case Long
        case Gross
    }
    
    enum Color {
        case White
        case Black
        case Blue
        case Red
        case Green
        case Purple
    }
    
    func clipNails() {
        println("You're clipping your nails.")
        length = .Short
    }
    
    func scratch() {
        println("You're scratching something with your fingernail.")
    }
    
    func colorNails() {
        println("You're coloring your nails.")
        color = .Purple
    }
    
}

var newFinger = Fingers()

var newFingernails = Fingernails()


class Back: BodyPart {
    var isItchy: Bool = true
    var hips = Hips()
    var isStiff: Bool = true
    
    func scratchBack() {
        println("You're scratching your back.")
        isItchy = false
    }
    
    func stretchBack() {
        println("You're stretching your back.")
        isStiff = false
    }
    
    func touchBack() {
        println("You're touching your back.")
    }
}

class Hips: BodyPart {
    var butt = Butt()
    var isShaking = false
    var isMoving = false
    
    func dance() {
        println("You're dancing.")
        butt.Dance()
        isShaking = true
        isMoving = true
    }
    
    func shake() {
        println("You're shaking your hips.")
        isShaking = true
    }
    
    func handsOnHips() {
        println("You're putting your hands on your hips.")
    }
    

}

class Butt: BodyPart {
    
    var legs = Legs()
    var isItchy: Bool = true
    var isSitting: Bool = false
    
    
    func sitDown() {
        println("You're sitting down.")
        isSitting = true
        legs.sitDown()
    }
    
    func scratch() {
        println("You're now wearing shoulderpads.")
        isItchy = false
    }
    
    func Dance() {
        println("You're dancing.")
        legs.dance()
        
    }
    
}

class Legs: BodyPart {
    
    var feet = Feet()
    var knees = Knees()
    var toes = Toes()
   
    
    func sitDown() {
        println("You're sitting down.")
    }
    
    func dance() {
        println("You're dancing.")
    }
    
    func walk() {
        println("You're walking.")
        feet.walk()
        knees.walk()

    }
    
}

class Knees: BodyPart {
    
    var isOpen: Bool = true
    var isPointy: Bool = false
    var feet = Feet()
    
    
    func close() {
        println("You're closing your knees.")
        isOpen = false
    }
    
    func walk() {
        println("You're moving your kness as you walk.")
    }
    
    func touch() {
        println("You're touching your knees.")
    }
    
}

class Feet: BodyPart {
    
    var isOpen: Bool = false
    var toes = Toes()
    var toenails = Toenails()
    
    
    func close() {
        println("You're closing your toes.")
        isOpen = false
        toes.close()
    }
    
    func open() {
        println("You're opening your toes.")
        isOpen = true
        toes.isOpen = true
    }
    
    func walk() {
        println("You're walking.")
    }
    
}

class Toes: BodyPart {
    
    var isOpen: Bool = false
    var fingernails = Fingernails()
    var isPointing: Bool = false
    
    
    func point() {
        println("You're your fingers.")
        isPointing = true
    }
    
    func scratch() {
        println("You're scratching something with your finger.")
        fingernails.scratch()
    }
    
    func close() {
        println("You're closing your fingers.")
    }
    
}

class Toenails: BodyPart {
    
    var length: Length = .Long
    var color: Color = .White
    var isSharp: Bool = false
    
    enum Length {
        case Short
        case Medium
        case Long
        case Gross
    }
    
    enum Color {
        case White
        case Black
        case Blue
        case Red
        case Green
        case Purple
    }
    
    func clipNails() {
        println("You're clipping your toenails.")
        length = .Short
    }
    
    func scratch() {
        println("You're scratching something with your toenail.")
    }
    
    func colorNails() {
        println("You're coloring your toenails.")
        color = .Purple
    }
    
}

