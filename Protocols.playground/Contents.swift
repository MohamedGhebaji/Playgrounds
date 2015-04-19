//: Playground - noun: a place where people can play

import UIKit

//protocols
protocol Transmittable {
    func toData() -> NSData
}

protocol JSONTransmittable : Transmittable {
    var json: String { get set }
    mutating func toJSON() -> String
}

@objc protocol Persistable {
    optional func load()
}


//implementation
class Checker : Transmittable {
    var x = 0
    var y = 0
    
    func toData() -> NSData {
        var data = ["x" : x, "y" : y] as NSDictionary
        return NSKeyedArchiver.archivedDataWithRootObject(data)
    }
}

class JSONChecker : JSONTransmittable, Persistable {
    var x = 0
    var y = 0
    var json = ""
    
    func toData() -> NSData {
        var data = ["x" : x, "y" : y] as NSDictionary
        return NSKeyedArchiver.archivedDataWithRootObject(data)
    }
    
    func toJSON() -> String {
        json = "{ x: \(x), y: \(y) }"
        return json
    }
}

struct Pawn : JSONTransmittable {
    var x = 0
    var y = 0
    var json = ""
    
    func toData() -> NSData {
        var data = ["x" : x, "y" : y] as NSDictionary
        return NSKeyedArchiver.archivedDataWithRootObject(data)
    }
    
    mutating func toJSON() -> String {
        json = "{ x: \(x), y: \(y) }"
        return json
    }
}



var transmittable = [Transmittable]()
transmittable.append(Checker())
transmittable.append(JSONChecker())

var item = transmittable[0]
item.toData()



//Challenge

protocol Iterator {
    func initWithArray(array:[AnyObject], start: Int, length: Int)
    func fisrt()
    func last()
    func isDone() -> Bool
    func next()
    func previous()
    func current() -> AnyObject?
}


class ArrayIterator: Iterator {
    
    var array: [AnyObject] = []
    private var firstIndex = 0
    private var lastIndex = 0
    private var currentIndex = -1
    
    
    init(array: [AnyObject]) {
        self.initWithArray(array, start: 0, length: array.count)
    }
    
    func initWithArray(array: [AnyObject], start: Int, length: Int) {
        
        assert(start >= 0, "array can't be null")
        assert(start < array.count, "Start can't be > array.length")
        assert(length >= 0, "length can't be < 0")
        
        self.array = array
        firstIndex = start
        lastIndex = start + length - 1
    }
    
    func fisrt() {
        currentIndex = firstIndex
    }
    
    func last() {
        currentIndex = lastIndex
    }
    
    func next() {
        ++currentIndex
    }
    
    func previous() {
        --currentIndex
    }
    
    func isDone() -> Bool {
        return currentIndex < firstIndex || currentIndex > lastIndex
    }
    
    func current() -> AnyObject? {
        if isDone() {
            return nil
        }
        
        return array[currentIndex]
    }
}


@objc protocol Shape {
    var x: CGPoint { get set}
    var y: CGPoint { get set}
    var z: CGPoint { get set}
    func centroid() -> CGPoint
    optional func area() -> CGFloat

}


class Traingle : Shape {
    @objc var x: CGPoint = CGPoint(x: 0, y: 0)
    @objc var y: CGPoint = CGPoint(x: 0, y: 0)
    @objc var z: CGPoint = CGPoint(x: 0, y: 0)

    @objc func centroid() -> CGPoint {
        var xPoint = (CGFloat(x.x + y.x + z.x) / 3.0)
        var yPoint = (CGFloat(x.y + y.y + z.y) / 3.0)
        return CGPoint(x: xPoint, y: yPoint)

    }
}
