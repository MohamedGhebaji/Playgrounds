//: Playground - noun: a place where people can play

import UIKit

var myClosure = { (x: Int) -> Int
                    in
                        return x + 10
}


myClosure(10)


class AnotherClosure {
    var baseValue = 10
    func add() -> () -> Int {
        return { () -> Int
                    in
                        self.baseValue += 10
                        return self.baseValue
        }
    }
}

var closure = AnotherClosure().add()
closure()
closure()
closure()


var numbers = [10, 1, 45, 15, -23]

numbers.sort({ (numberA: Int, numberB: Int) -> Bool in
    return numberA > numberB })

// or 

numbers.sort { (numberA: Int, numberB: Int) -> Bool in
    return numberA > numberB }

// or

numbers.sort { (numberA: Int, numberB: Int) -> Bool in
            numberA > numberB }

// or

numbers.sort { $0 > $1 }
numbers


// or 

numbers.sort(>)

// Challenge



class InterestCalculator {
    var principal: Float = 0.0
    var rate: Float = 0.0
    var paymentsPerYear = 0
    var time: Int = 0
    
    
    lazy var simpleInterest: Float = { () -> Float in
        var rate = ((self.rate / 100.0) * Float(self.time)) + 1.0
        var interest = rate * self.principal
        return interest
    }()
    
    lazy var compoundInterest: Float = { () -> Float in
        var power = pow(1.0 + (self.rate / 100.0), Float(self.time))
        var interest = Float(self.principal * power)
        return interest
        }()
}


var calc = InterestCalculator()
calc.principal = 56504
calc.rate = 7.5
calc.time = 10


calc.simpleInterest

