//: Playground - noun: a place where people can play

import UIKit


struct Address {
    var street: String
    var city: String
    var state: String
    var zipCode: String
    static var defaultStreet = "1600 Pennsylvania Avenue"
    
    mutating func resetStreet(newStreet: String) {
        street = newStreet
    }
    
    func isValidate() -> Bool {
        if state == "Virginia" || state == "Vermont" {
            return true
        }
        
        return false
    }
}

var address = Address(street: "1428 Elm Strret", city: "SpringWood", state: "Ohio", zipCode: "04032")

address.street

var address2 = address

address2.state = "Florida"

Address.defaultStreet
address2.isValidate()
address2.resetStreet("zarzis")
address2.street



// Challenge


struct Vertor {
    var x: Float
    var y: Float
    var z: Float
    
    mutating func add(newVector: Vertor) {
        x += newVector.x
        y += newVector.y
        z += newVector.z
    }
}



var vectorA = Vertor(x: 0, y: 4, z: 15)
var vectorB = Vertor(x: 10, y: 20, z: 15)

vectorA.add(vectorB)
vectorA.x
vectorA.y
vectorA.z



