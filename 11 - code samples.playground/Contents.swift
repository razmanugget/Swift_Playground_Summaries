import UIKit
import Foundation
//import func Darwin.sqrt


// check for API availability (iOS 7+)
// ----------------------------------------------------------------------------
if #available(iOS 9, OSX 10.10, *) {
  // Use iOS 9 APIs on iOS, and use OS X v10.10 APIs on OS X
} else {
  // Fall back to earlier iOS and OS X APIs
}

// mark an entire func/class to require a specific iOS version
// ----------------------------------------------------------------------------
@available(iOS 9, *)
func useStackView() {
  // use UIStackView
}



// find the user's region setting
// ----------------------------------------------------------------------------
let locale = Locale.current
print(locale.regionCode!)



// Fizz Buzz
// ----------------------------------------------------------------------------
for i in 0...100 {
  switch (i % 3 == 0, i % 5 == 0) {
  case (true, false):
    print("Fizz")
  case (false, true):
    print("Buzz")
  case (true, true):
    print("FizzBuzz")
  default:
    print(i)
  }}



// writing a String to disk
// ----------------------------------------------------------------------------
// find the path to save
func getDocumentsDirectory() -> URL {
  let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
  return paths[0]
}
// writing to disk may throw an exception - use do/catch
let str = "Super long string here"
let filename = getDocumentsDirectory().appendingPathComponent("output.txt")
do {
  try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
} catch {
  // failed to write file – bad permissions, filename, missing permissions, or more likely it can't be converted to the encoding
}



// generate a universally unique identifier
// ----------------------------------------------------------------------------
let uuid = UUID().uuidString
print(uuid)

// generate a unique identifier per developer account (vendor)
// ----------------------------------------------------------------------------
if let vendorUUID = UIDevice.current.identifierForVendor?.uuidString {
  print(vendorUUID)
}



// make a device vibrate
// ----------------------------------------------------------------------------
import AVFoundation

AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)

// as an Extension
extension UIDevice {
  static func vibrate() {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
  }}
// now to use
UIDevice.vibrate()


// parse a sentence into nouns, verbs...
// ----------------------------------------------------------------------------
let options = NSLinguisticTagger.Options.omitWhitespace.rawValue | NSLinguisticTagger.Options.joinNames.rawValue
let tagger = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemes(forLanguage: "en"), options: Int(options))

let inputString = "This is a very long test for you to try"
tagger.string = inputString

let range = NSRange(location: 0, length: inputString.utf16.count)
tagger.enumerateTags(in: range, scheme: .nameTypeOrLexicalClass, options: NSLinguisticTagger.Options(rawValue: options)) { tag, tokenRange, sentenceRange, stop in
  guard let range = Range(tokenRange, in: inputString) else { return }
  let token = inputString[range]
  print("\(tag ?? NSLinguisticTag(rawValue: "hello")): \(token)")
}



// Creating a list of prime numbers
// ----------------------------------------------------------------------------
var primeList = [2.0]
var num = 3.0
var isPrime = 1
while primeList.count < 100 {
  let sqrtNum = sqrt(num)
  // test by dividing only with prime numbers
  for primeNumber in primeList {
    // skip testing with prime numbers > than square root of number
    if num.truncatingRemainder(dividingBy: primeNumber) == 0 {
      isPrime = 0
      break
    }
    if primeNumber > sqrtNum {
      break
    }}
  if isPrime == 1 {
    primeList.append(num)
  } else {
    isPrime = 1
  }
  num += 2
}
print(primeList)



// Playing Craps
// ----------------------------------------------------------------------------
enum Status {
  case playagain, won, lost
}
enum DiceNames: Int {
  case snakeEyes = 2
  case trey = 3
  case seven = 7
  case yoLeven = 11
  case boxCars = 12
}

func rollDice() -> (die1: Int, die2: Int, sum: Int) {
  let die1 = Int(1 + arc4random_uniform(6))
  let die2 = Int(1 + arc4random_uniform(6))
  return (die1, die2, die1 + die2)
}
func displayRoll(roll: (Int, Int, Int)) {
  print("Player rolled \(roll.0) + \(roll.1) = \(roll.2)")
}

var myPoint = 0
var gameStatus = Status.playagain
var roll = rollDice()

displayRoll(roll: roll)

switch roll.sum {
case DiceNames.seven.rawValue, DiceNames.yoLeven.rawValue:
  gameStatus = Status.won
case DiceNames.snakeEyes.rawValue, DiceNames.trey.rawValue,DiceNames.boxCars.rawValue:
  gameStatus = Status.lost
default:
  gameStatus = Status.playagain
  myPoint = roll.sum
  print("Point is \(myPoint)")
}

while gameStatus == Status.playagain {
  roll = rollDice()
  displayRoll(roll: roll)
  if roll.sum == myPoint {
    gameStatus = Status.won
  } else {
    if (roll.sum == DiceNames.seven.rawValue) {
      gameStatus = Status.lost
    }}}

if gameStatus == Status.won {
  print("Player wins")
} else {
  print("Player loses")
}



// map names to digits... or use
// ----------------------------------------------------------------------------
let digitNames = [
  0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
  5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]

let numbers = [16, 58, 510]

let strings = numbers.map{(number) -> String in
  var number = number
  var output = ""
  repeat {
    output = digitNames[number % 10]! + output
    number /= 10
  } while number > 0
  return output
}



// get / set example from Swift in 24 hrs ----------  Very Nice!
// ----------------------------------------------------------------------------
class Vehicle {
  var speed:Int
  var speedLimit:Int {
    willSet {
      print("Preping to change speed to: \(newValue) MPH")
    }
    didSet {
      let changeSpeed: () -> () = (speed > speedLimit) ? slowdown : speedup
      while speed != speedLimit {
        changeSpeed()
      }
      print("Now driving \(speed) MPH because the speed limit changed to \(speedLimit) MPH from \(oldValue) MPH\n")
    }}
  
  init(speedLimit:Int, speed:Int) {
    self.speedLimit = speedLimit
    self.speed = speed
    print("Speed limit is \(speedLimit) MPH, I'm driving: \(speed) MPH")
  }
  
  func speedup() {
    print("Speed up to \(speed += 1) MPH...")
  }
  
  func slowdown() {
    print("Slow down to \(speed -= 1) MPH...")
  }}

let car = Vehicle(speedLimit: 65, speed: 65)
car.speedLimit = 55
car.speedLimit = 70



// track the highest level achieved
// ----------------------------------------------------------------------------
struct LevelTracker {
  static var highestUnlockedLevel = 1
  var currentLevel = 1
  
  static func unlock(_ level: Int) {
    if level > highestUnlockedLevel { highestUnlockedLevel = level }
  }
  static func isUnlocked(_ level: Int) -> Bool {
    return level <= highestUnlockedLevel
  }
  
  @discardableResult
  mutating func advance(to level: Int) -> Bool {
    if LevelTracker.isUnlocked(level) {
      currentLevel = level
      return true
    } else {
      return false
    }}}

class Player {
  var tracker = LevelTracker()
  let playerName: String
  func complete(level: Int) {
    LevelTracker.unlock(level + 1)
    tracker.advance(to: level + 1)
  }
  init(name: String) {
    playerName = name
  }}

var playerz = Player(name: "Apollo")
playerz.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")



// inheritance and overriding
// ----------------------------------------------------------------------------
class Shape {
  var title = "shape"
  func area() -> Double {
    return 0.0
  }
  func description() -> String {
    return "I am a \(title). My area is \(area())"
  }}

class Square: Shape {
  var sideLength = 0.0
  override func area() -> Double {
    return sideLength * sideLength
  }}

class Circle: Shape {
  var radius = 0.0
  override func area() -> Double {
    return .pi * radius * radius
  }}

class Sphere: Circle {
  override func description() -> String {
    return super.description() + ". My volume is \(volume())"
  }
  func volume() -> Double {
    return (4.0 * super.area() * radius) / 3.0
  }}

func printDescForShape(shape: Shape) {
  print(shape.description())
}

let shape = Shape()
let square = Square()

square.sideLength = 4
square.title = "SQUARE"

shape.area()
shape.description()
square.area()
square.description()

let sphere = Sphere()
sphere.title = "SPHERE"
sphere.radius = 2.0
sphere.area()
sphere.volume()
sphere.description()

// these show how the function goes to the respective description method for each instance
printDescForShape(shape: square)
printDescForShape(shape: sphere)



// finding mean, median, mode
// ----------------------------------------------------------------------------
//func meanMedianMode (numbers:Int...) ->
//  (mean:Double, median:Int, mode:Int) {
//
//    // mean
//    var sum = 0.0
//    for numb in numbers {
//      sum += Double(numb)
//    }
//    let mean = sum/Double(numbers.count)
//
//    // median
//    let sortedNumbers = numbers.sorted(by: <)
//    let midIndex = numbers.count/2
//    let median = sortedNumbers[midIndex]
//
//    // mode
//    var counts = [Int:Int]()
//    //--- track multiple occurences in dictionary
//    modeArray.forEach { counts[$0] = (counts[$0] ?? 0) + 1 }
//    //--- find the highest pair and store
//    var highestPair:(key:Int, value:Int) = (0,0)
//    for (key, value) in counts {
//      highestPair = (value > highestPair.value) ? (key, value):highestPair
//    }
//    let mode = highestPair.key
//    return (mean, median, mode)
//}
//
//let mmm = meanMedianMode(numbers: 1, 1, 2, 3, 5, 8, 13)
//
//mmm.mean
//mmm.median
//mmm.mode



/*
 // finding mean, median, mode - functions broken out
 func mean(numbers:[Int]) -> Double {
 var sum = 0.0
 
 for numb in numbers {
 sum += Double(numb)
 }
 let mean = sum/Double(numbers.count)
 return mean
 }
 
 func median(numbers:[Int]) -> Double {
 let sortedNumbers = numbers.sorted({(num1:Int, num2:Int) -> Bool in return num1 < num2
 })
 let midIndex = numbers.count/2
 let median = Double(sortedNumbers[midIndex])
 return median
 }
 
 func mode(numbers:[Int]) -> Double {
 var occurences:[Int:Int]=[:]
 
 //--- track multiple occurences in dictionary
 for number in numbers {
 if var value = occurences[number] {
 occurences[number] = ++value
 } else {
 occurences[number] = 1
 }
 }
 //--- find the highest pair and store
 var highestPair:(key:Int, value:Int) = (0,0)
 for (key, value) in occurences {
 highestPair = (value > highestPair.value) ? (key, value):highestPair
 }
 
 return Double(highestPair.key)
 }
 
 func performMathAverage(mathFunc:String) -> ([Int]) -> Double {
 switch mathFunc {
 case "mean":
 return mean       // not calling the method, just returning reference
 case "median":
 return median
 default:
 return mode
 }
 }
 
 var mathFunc = performMathAverage("mean")
 mathFunc([1, 1, 2, 3, 5, 8, 13])
 
 mathFunc = performMathAverage("median")
 mathFunc([4, 5, 6])
 
 mathFunc = performMathAverage("mode")
 mathFunc([1, 1, 2, 3, 5, 8, 13])
 */

/*
 // finding mean, median, mode - functions nested
 func performMathAverage(mathFunc:String) -> ([Int]) -> Double {
 
 func mean(numbers:[Int]) -> Double {
 var sum = 0.0
 
 for numb in numbers {
 sum += Double(numb)
 }
 let mean = sum/Double(numbers.count)
 return mean
 }
 
 func median(numbers:[Int]) -> Double {
 let sortedNumbers = numbers.sorted({(num1:Int, num2:Int) -> Bool in return num1 < num2
 })
 let midIndex = numbers.count/2
 let median = Double(sortedNumbers[midIndex])
 return median
 }
 
 func mode(numbers:[Int]) -> Double {
 var occurences:[Int:Int]=[:]
 
 //--- track multiple occurences in dictionary
 for number in numbers {
 if var value = occurences[number] {
 occurences[number] = (value += 1)
 } else {
 occurences[number] = 1
 }
 }
 //--- find the highest pair and store
 var highestPair:(key:Int, value:Int) = (0,0)
 for (key, value) in occurences {
 highestPair = (value > highestPair.value) ? (key, value):highestPair
 }
 
 return Double(highestPair.key)
 }
 
 switch mathFunc {
 case "mean":
 return mean       // not calling the method, just returning reference
 case "median":
 return median
 default:
 return mode
 }
 }
 
 var mathFunc = performMathAverage("mean")
 mathFunc([1, 1, 2, 3, 5, 8, 13])
 
 mathFunc = performMathAverage("median")
 mathFunc([4, 5, 6])
 
 mathFunc = performMathAverage("mode")
 mathFunc([1, 1, 2, 3, 5, 8, 13])
 
 /*
 // exercise
 func square(var num:Int) -> Int {
 return num * num
 }
 
 var squareArray = [4, 6, 7]
 var newArray = []
 
 for i in squareArray {
 newArray = [square(i)]
 //   newArray[i]
 }
 */
 
 
 
 // exercise book answer - similar to built-in map function
 func square(num:Int) -> Int {
 return num * num
 }
 
 func mapEachElement(inArray arr:[Int], withFunc aFunc:(Int) -> Int) -> [Int] {
 var returnArray = [Int]()
 for num in arr {
 returnArray.append(aFunc(num))
 }
 return returnArray
 }
 
 let firstArray = [1, 2, 3, 4, 5]
 let squareArray = mapEachElement(inArray: firstArray, withFunc: square)
 
 
 
 // using another function as a parameter in a function
 func deposit(amt:Double, acct:(name:String, bal:Double)) -> (String, Double) {
 var newBal:Double = acct.bal + amt
 return (acct.name, newBal)
 }
 
 func withdraw(amt:Double, acct:(name:String, bal:Double)) -> (String, Double) {
 var newBal:Double = acct.bal - amt
 return (acct.name, newBal)
 }
 
 let mondayTrans = deposit
 let fridayTrans = withdraw
 
 var acct1 = ("Personal Acct", 1011.10)
 var acct2 = ("Business Acct", 24399.72)
 
 let mondayBal = mondayTrans(300.0, acct1)
 let fridayBal = fridayTrans(1200, acct2)
 
 
 // (Double, (String, Double)) is the return type
 // (String, Double) - return type of the returned function
 func chooseTrans(trans:String) -> (Double, (String, Double)) -> (String, Double) {
 if trans == "Deposit" {
 return deposit
 }
 return withdraw
 }
 
 // calling the functions
 chooseTrans("Withdraw")(63.17, acct1)
 chooseTrans("Deposit")(1589.52, acct2)
 
 
 */


// *** next example set ***





