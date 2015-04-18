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
    var onShelfBooks: [Book] = []
    var onLoanBooks: [Book] = []
    
    var books: [Book] {
        get {
            return onLoanBooks + onShelfBooks
        }
        set(newValue) {
            onShelfBooks += newValue
        }
    }
    
}

class OnLineLibrary {
    var onLoanBooks: [Book] = []
    var onShelfBooks: [Book] = []
    lazy var books: [Book] = self.importBooks()
    
    
    func importBooks() -> [Book] {
        var url = NSURL(string: "http://www.raywenderlich.com/downloads/books.json")
        var request = NSURLRequest(URL: url!)
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
        var error: NSErrorPointer = nil
        var data: NSData = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: error)!
        var json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        var importedBooks = [Book]()
        if let books: [NSDictionary] = json["Books"] as? [NSDictionary] {
            for book in books {
                var title: String? = book["Title"] as? String
                var pageCount: Int? = book["pageCount"] as? Int
                if title == nil {
                    title = ""
                }
                if pageCount == nil {
                    pageCount = 0
                }
                importedBooks.append(Book(title: title!, pageCount: pageCount!))
            }
        }
        
        return importedBooks
    }
}

var iOSGames = Book(title: "iOS Games by Tuto", pageCount: 819)
var iOSByTuto = Book(title: "iOS 8 by Tuto", pageCount: 763)
var iOSAnimation = Book(title: "iOS Animation by Tuto", pageCount: 317)

var library = Library()
library.onShelfBooks = [iOSGames]
library.onLoanBooks = [iOSAnimation]
library.books
library.books += [iOSByTuto]
library.onShelfBooks

var onlineLibrary = OnLineLibrary()
onlineLibrary.books









