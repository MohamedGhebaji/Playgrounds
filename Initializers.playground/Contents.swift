//: Playground - noun: a place where people can play

import UIKit

class Story {
    var wordCount: Int
    var title: String
    var genre: String
    
    init(wordCount: Int, title: String, genre: String) {
        self.wordCount = wordCount
        self.title = title
        self.genre = genre
    }
}


class ScreenPlay: Story {
    var acts: Int
    var collaborators: [String]
    
    init?(acts: Int, collaborators: [String], wordCount: Int, title: String, genre: String) {

        self.acts = acts
        self.collaborators = collaborators
        super.init(wordCount: wordCount, title: title, genre: genre)
        if wordCount < 0 {
            return nil
        }
    }
    
    convenience init?(title :String, collaborators: [String]) {
        self.init(acts:3, collaborators:collaborators,wordCount:0, title: title, genre: "Drama")
    }
}


var myScreenplay = ScreenPlay(acts: 3, collaborators: [], wordCount: -100, title: "", genre: "")

if let myScreenplay = myScreenplay {
    myScreenplay.title
}

//Challenge

class Account {
    var firstName: String
    var lastName: String
    var balance: Int
    
    init(firstName:String, lastName:String, balance:Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.balance = balance
    }
}

class CheckingAccount : Account {
    var interestRate: Float
    
    init?(firstName:String, lastName:String, balance:Float) {
        self.interestRate = 0
        super.init(firstName: firstName, lastName: lastName, balance: 0)
        
        if balance < 0 {
            return nil
        }
    }
    
    convenience init?(balance:Float) {
        self.init(firstName:"", lastName:"", balance:balance)
        if balance > 0 {
            return nil
        }
    }
}


var checkingAccount = CheckingAccount(balance: 10)
var anotherCheckingAccount = CheckingAccount(firstName: "Brian", lastName: "Moakley", balance: 10)