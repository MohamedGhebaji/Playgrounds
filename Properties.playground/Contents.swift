//: Playground - noun: a place where people can play

import UIKit

struct Item {
    var name: String
    var value: Int
}

class Barbarian {
    var name = "Conan"
    var strength = 18
    var intelligence = 10
    lazy var inventory: [Item] = self.importInventory()
    
    var dextirity: Int {
        get {
            return (strength + intelligence)
        }
        set(newDextirity) {
            strength = Int((Float(newDextirity)) * 0.75)
        }
    }
    
    var health: Int = 100 {
        willSet(value) {
            if value < health {
                println("Damage Sound")
            } else {
                println("Healing Sound")
            }
        }
        
        didSet {
            println("call observers")
        }
    }
    
    func importInventory() -> [Item] {
        var item = Item(name: "", value: 0)
        var item1 = Item(name: "", value: 1)

        return [item, item1];
    }
    
}


var barbanian = Barbarian();
barbanian.inventory
barbanian.dextirity = 18
barbanian.health = 90

// Challenge

struct Book {
    var title: String
    var pageCount: Int
}

class Library {
    var onShelfBooks: [Book]!
    var onLoanBooks: [Book]!
    
    
}















