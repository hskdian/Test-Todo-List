//: Playground - noun: a place where people can play

import UIKit

let names = ["Cc", "Aa", "Ee", "Bb", "Dd"]

var firstname = names[1]

print(firstname)

let error = (404, "Not Found")

print("The status code is \(error.0)")
print("The status message is \(error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

enum Compass {
    case North,South,East,West
}

print ("\(Compass.West)")


func myFunc(p1: Int = 1, p2: Int=2) {
    print(p1*p2)
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("The width is \(someResolution.width)")

print(someVideoMode.resolution.width)

someVideoMode.resolution.width = 1280

print("The width is \(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480)

print("The resolution width is \(vga.width).The Resolution height is \(vga.height)")

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("hd is still \(hd.width) pixels wide")

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true

let alsoTenEighty = tenEighty
alsoTenEighty.interlaced = false

struct Point {
    var x = 0.0, y = 0.0
}
struct Shape {
    var origin = Point()
    var center: Point {
        get {
            return Point(x: origin.x/2 , y: origin.y/2)
        }
        set(newCenter) {
            origin.x = newCenter.x/2
            origin.y = newCenter.y/2
        }
    }
}

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newSteps) {
            print("About to set totalSteps to \(newSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 50
stepCounter.totalSteps = 150
stepCounter.totalSteps = 420

class SomeClass {
    static var storedProp = "Some value."
    static var computedProp: Int {
        return 42
    }
}

print(SomeClass.storedProp)

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
print (counter.count)
counter.incrementBy(amount: 5)
print (counter.count)
counter.reset()
print (counter.count)

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print(threeTimesTable[5])

class Vehicle {
    var currentSpeed = 0.0
    var desc: String {
        return "traveling at \(currentSpeed) mph"
    }
    func makeNoise() {
        // do nothing
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 25.0
print("Bicycle: \(bicycle.desc)")

class Tandem: Bicycle {
    var currNumOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currNumOfPassengers = 2
tandem.currentSpeed = 20.0
print("Tandem: \(tandem.desc)")

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

class Car: Vehicle {
    var gear = 1
    override var desc: String {
        return super.desc + " in gear \(gear)"
    }
}

struct Fahrenheit {
    var temp: Double
    init() {
        temp = 32.0
    }
}
var f = Fahrenheit()

struct Celsius {
    var tempInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        tempInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        tempInCelsius = kelvin - 273.15
    }
}
let boilingPoint = Celsius(fromFahrenheit: 212.0)
let freezingPoint = Celsius(fromKelvin: 273.15)

class Size {
    var width:Double, height:Double
    init(w:Double, h:Double) {
        width = w
        height = h
    }
}
let twoByTwo = Size(w: 2.0, h: 2.0)

class Person: NSObject, NSCoding {
    let name: String
    let age: Int
    required init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.age = decoder.decodeInteger(forKey: "age")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(age, forKey: "age")
    }
}
