import UIKit

// class type properties & methods
// ----------------------------------------------------------------------------

// type properties
// ----------------------------------------------------------------------------
class Person {
  static var count: Int {
    return 250
  }
  
  class var averageAge: Double {
    return 30
  }
}

class Student: Person {
  // THIS ISN'T ALLOWED
//  override static var count: Int {
//    return 150
//  }
  
  // THIS IS ALLOWED
  override class var averageAge: Double {
    return 19.5
  }
}


// struct type properties --------------------------
struct Square2 {
   static var desc = "This describes a square"
}

Square2.desc        // this describes...
// -------------------------------------------------


// struct type methods -----------------------------
struct Counter {
   static var count = 0
   static func increaseCountByOne() {
      count += 1
   }}

Counter.count
Counter.increaseCountByOne()
Counter.count
// -------------------------------------------------


// class subscripts (standard) ---------------------
class Person4 {
   var roles = ["Manager", "Parent", "Runner"]
   
   // assign array subscripts to roles var
   subscript(index:Int) -> String {
      get {
         return roles[index]
      }
      set(newValue) {
         self.roles[index] = newValue
      }}}

var p = Person4()    // assigns all roles

print(p[1])        // o: parent

p[0] = "Coach"       // changed from manager
// -------------------------------------------------


// class subscripts --------------------------------
class CubeANum {
   subscript(num:Int) -> Int {
      return num * num * num
   }}

let cubeANum = CubeANum()
cubeANum[2]             // o: 8
cubeANum[5]             // o: 125
// -------------------------------------------------


// access levels -----------------------------------
public var myVar1: String = "share with the entire project"

class MyClass {
   private var myVar2:String = "only shared w/in the file"
   
   func prVar () -> String {
      return("hello")
   }}

myVar1               // no need to initialize a public var

let j = MyClass()
//j.myVar2

// -------------------------------------------------


// type casting ------------------------------------
let f1:Float = 9.99

let i1 = Int(f1)     // r: i1 = 9, round down
let d1 = Double(f1)  // r: 9.98999
//let b1 = Bool(0)    // r: true, only 0 = false
let s1 = String(f1)  // r: "9.99"

let s2 = "howdy"
var i2 = Int(s2)     // r: Optional (nil)
var d2 = Double(s1)  // r: 9.99 but if string, then (nil)

let actuallyDouble = 3 as Double
// -------------------------------------------------


// type check operator - simplified ----------------
class Round {
   var holes:Int
   init(holes:Int) {
      self.holes = holes
   }}

class Fluffy {
   var pegs:Int
   init(pegs:Int) {
      self.pegs = pegs
   }}

let toyBox = [Round(holes: 4), Round(holes: 3),
   Fluffy(pegs: 2), Fluffy(pegs: 8),
   Round(holes: 1), Round(holes: 7)] as [Any]

var roundCount = 0, fluffyCount = 0

for toy in toyBox {
   if toy is Round {          // is - type checking
      roundCount += 1
   } else if toy is Fluffy {
      fluffyCount += 1
   }}

roundCount        // o: 4
fluffyCount       // o: 2


// type check & type caste operator ----------------
class Instrument {
   var name:String
   init(name:String) {
      self.name = name
   }}
class Brass: Instrument {
   let valves:Int
   init(name:String, valves:Int) {
      self.valves = valves
      super.init(name: name)
   }}
class Woodwind: Instrument {
   let keys:Int
   init(name:String, keys:Int) {
      self.keys = keys
      super.init(name: name)
   }}

let marchingInstruments = [
   Brass(name: "Trumpet", valves: 3),
   Brass(name: "Trombone", valves: 0),
   Woodwind(name: "Clarinet", keys: 18),
   Woodwind(name: "Alto Sax", keys: 22),
   Brass(name: "Piccolo Trumpet", valves: 4)
]
var brassCount = 0, woodwindCount = 0

// type checking
for instrument in marchingInstruments {
   if instrument is Brass {
      brassCount += 1
   } else if instrument is Woodwind {
      woodwindCount += 1
   }}

brassCount        // o: 3
woodwindCount     // o: 2

// type casting - with as?
func displayInstrumentInfo(instrument: Instrument) {
  if let brass = instrument as? Brass {
    print("Brass: \(brass.name). Valves: \(brass.valves)")
  } else if let woodwind = instrument as? Woodwind {
    print("Woodwind: \(woodwind.name). Keys: \(woodwind.keys)")
  }}

displayInstrumentInfo(instrument: marchingInstruments[0])
displayInstrumentInfo(instrument: marchingInstruments[2])



// EXTENSIONS
// simple example with an Int
// ----------------------------------------------------------------------------
extension Int {
  func plusOne() -> Int {
    return self + 1
  }
  
  mutating func mutatePlusOne() {
    self += 1
  }}

// in this case, the original is not modified
var myInt = 5
myInt.plusOne()           // o: 6
myInt                     // o: 5
5.plusOne()               // o: 6  (still not modified)

// modify the original using a mutating extension
var myInt2 = 8
myInt2.mutatePlusOne()
myInt2


// string example
// ----------------------------------------------------------------------------
extension String {
  var asArray: [Character] {
      var result = [Character]()
      for character in self {
         result.append(character)
      }
      return result
   }}

let chars = "Hello".asArray         // o: H, e, l, l, o
let dog = "Fido"
let dogChars = dog.asArray          // o: F, i, d, o


// Class example
// ----------------------------------------------------------------------------
class PersonAge {
  var name:String = "Name"
  var age:Int = 0
  
  func profile() -> String {
    return "I'm \(self.name) and I'm \(self.age) years old."
  }}

extension PersonAge {
  var dogYears:Int {
    get {
      return self.age * 7
    }}}

//// simplified extension
//extension PersonAge {
//  var dogYears:Int {return self.age * 7}
//}

var pAge = PersonAge()
pAge.name = "Matt"
pAge.age = 40                         // o: 280

print(pAge.dogYears)


// Extension - with a typealias
// ----------------------------------------------------------------------------
typealias MPH = Double
extension MPH {
   var kmPerHour: Double {return self * 1.60934}
   var milesPerMinute: Double {return self / 60.0}
}

let speed: MPH = 60
let kmH = speed.kmPerHour           // o: 96.56
let mpM = speed.milesPerMinute      // o: 1



/*
// Extension - with a subscript
// ----------------------------------------------------------------------------

extension String {
   var asArray2: [Character] {
      var result = [Character]()
      for character in self {
         result.append(character)
      }
      return result
   }}

extension String {
   subscript(index: Int) -> Character? {
      if !self.isEmpty && index < countElements(self) && index >= 0 {
         return self.asArray2[index]
      }
      return nil
   }}

let words = "Smokey River"          // o: Smokey River
let fifthChar = words[4]!           // o: e
let emptyString = ""                // o: ""
let badIndex = emptyString[0]       // o: nil
// -----------------------------------------------------------
*/

// Extension - with a struct init
// ----------------------------------------------------------------------------
struct Circle {
   var radius = 0.0
   var circumference: Double {
      return 2 * radius * .pi
   }}

extension Circle {
  init(circumference: Double) {
      let radius = circumference/(2 * .pi)
      self.init(radius: radius)
   }}

let circle = Circle(circumference: 31.42)
circle.radius                       // o: 5.00


// Extension - with a class init
// ----------------------------------------------------------------------------
class Person5 {
   var fullName: String
   init(fullName: String) {
      self.fullName = fullName
   }}

extension Person5 {
   convenience init(firstName: String, lastName: String) {
      let fullName = firstName + " " + lastName
      self.init(fullName: fullName)
   }}

let person5 = Person5(firstName: "Tom", lastName: "Thumb")
person5.fullName                    // o: Tom Thumb


// Extension - with nested types
// ----------------------------------------------------------------------------
enum Transformers: String {
   case OptimusPrime = "Optimus Prime"
   case Bumblebee = "Bumblebee"
   case Megatron = "Megatron"
}

extension Transformers {
   enum TransformerType {
      case Autobot, Decepticon
   }
   
   var type: TransformerType {
      switch self {
      case .OptimusPrime, .Bumblebee:
         return .Autobot
      default:
         return .Decepticon
      }}}

let transformer = Transformers.Bumblebee
switch transformer.type {
case .Autobot:
   print("\(transformer.rawValue) is an Autobot.")
case .Decepticon:
   print("\(transformer.rawValue) is a Decepticon.")
}


// computed property vs method extensions
// ----------------------------------------------------------------------------
extension String {
  // computed property
  var trimmed: String {
    return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
  }
  // method
  mutating func trim() {
    self = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
  }}


// Extension - conforming to a protocol
// ----------------------------------------------------------------------------
protocol Squarable {
  func square() -> Int
}

extension Int: Squarable {
  func square() -> Int {
    return self * self
  }}

5.square()                         // o: 25


// ** Simple PROTOCOL-based programming
// ----------------------------------------------------------------------------
extension Int {
  func squared() -> Int {
    // self works with **current values**
    return self * self
  }}

// BinaryInteger is the protocol applied to Int, Int8, UInt64...)
extension BinaryInteger {
  // Self (cap) is working with all data types (Int, Int8, UInt64...)
  func squared2() -> Self {
    return self * self
  }}

var numInt: Int = 8
print(numInt.squared())                 // o: 64

var numInt2: UInt8 = 8
print(numInt.squared2())                // o: 64 works with Int
print(numInt2.squared2())               // o: 64 works with UInt8

