//: Playground - noun: a place where people can play

import UIKit

extension String {
    func backwards() -> String {
        var temp = ""
        for letter in reverse(self) {
            temp.append(letter)
        }
        
        return temp
    }
    
    var space: Int {
        get {
            var string = self as NSString
            return string.componentsSeparatedByString(" ").count
        }
    }
}

extension CGPoint {
    mutating func reset() {
        self.x = 0
        self.y = 0
    }
}


"MY name is Mohamed".backwards()
"MY name is Mohamed".space

var location = CGPoint(x: 10, y: 20)
location.reset()

// Challenge

extension Int {
    func toPoint() -> CGPoint {
        return CGPoint(x: self, y: self)
    }
}

10.toPoint()


extension String {
    enum Case {
        case UpperCase, LowerCase, MixedCase
    }
    var textCase: Case {
        var stringCase = Case.MixedCase
        var upperCount = 0
        var lowerCount = 0
        var letters = self.stringByReplacingOccurrencesOfString(" ", withString: "")
        for character in letters {
            var letter = String(character)
            if letter == letter.uppercaseString {
                println("letter: \(letter)")
                upperCount++
            }
            if letter == letter.lowercaseString {
                lowerCount++
            }
        }
        
        if upperCount > 0 && lowerCount == 0 {
            stringCase = Case.UpperCase
        }
        if upperCount == 0 && lowerCount > 0 {
            stringCase = Case.LowerCase
        }
        return stringCase
    }
}


if "This is mixed case".textCase == .MixedCase {
    println("mixed case")
}
if "THIS IS UPPER CASE".textCase == .UpperCase {
    println("upper case")
}
if "this is mixed case".textCase == .LowerCase {
    println("lower case")
}
