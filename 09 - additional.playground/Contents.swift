import UIKit
import GameplayKit


// Self Usage
class MyObject {
   var count = 7           // instance
   
   func badMethod() {
      var count = 42       // local var variable "hides" the instance var
      print(count)         // -> 42
   }
   func betterMethod() {
      var count = 42       // which one gets used
      print(self.count)    // -> 7  (** self references the instance var**)
   }
   func bestMethod() {
        var temp = count
        print(temp)        // -> 7  (no ambiguity)
     }
}


// Randomness
// these don't require GameplayKit
// ----------------------------------------------------------------------------
print(arc4random())               // completely random range
print(arc4random_uniform(6))      // range 0-5
print(Int.random(in: 1 ... 5))    // iOS 12 only

// using GameplayKit -> much more random, but not enough for cryptokeys
print(GKRandomSource.sharedRandom().nextInt(upperBound: 6))

// options with GameplayKit
// ----------------------------------------------------------------------------
// high performance, lowest randomness
let congruential = GKLinearCongruentialRandomSource()
congruential.nextInt(upperBound: 20)

// high randomness, lowest performance
let mersenne = GKMersenneTwisterRandomSource()
mersenne.nextInt(upperBound: 20)

// goldilocks of randomnesss
let arc4 = GKARC4RandomSource()
arc4.dropValues(1024)           // use to avoid guessable sequences (any)
arc4.nextInt(upperBound: 20)


// Random distributions
// creating a source for random distribution
// ----------------------------------------------------------------------------
let rand = GKMersenneTwisterRandomSource()
let distribution = GKRandomDistribution(randomSource: rand, lowestValue: 10, highestValue: 20)
print(distribution.nextInt())

// distribution with no repeats (go thru the entire sequence once)
// ----------------------------------------------------------------------------
let noRepeatDist = GKShuffledDistribution(randomSource: rand, lowestValue: 10, highestValue: 20)
print(noRepeatDist.nextInt())

// distribution forms a natural bell curve (more in middle)
// ----------------------------------------------------------------------------
let gaussianDist = GKGaussianDistribution(randomSource: rand, lowestValue: 10, highestValue: 20)
print(gaussianDist.nextInt())




/*
// Time
// ------------------------------------------------------------------------
func getTheHour() -> Int {
let calendar = Calendar.current
let currentTime = calendar.dateComponents(hour, from: Date())
return currentTime.hour!
}

let timeNow = getTheHour()

if (timeNow > 8 && timeNow < 22) {
print("daytime")
}


// nested types
// ------------------------------------------------------------------------
struct Shapes {
   struct Rectangle {
      var x:Int = 0
      var y:Int = 0
      var width:Int = 0
      var height:Int = 0
   }
   struct Circle {
      let pi:Float = 3.1415925
      var radius:Float = 0.0
   }
}

var d = Shapes.Circle()
d.radius = 45.0
// -----------------------------------------------------------
*/



// Generics - simply
// ----------------------------------------------------------------------------
func printWeather<T>(value:T) {
   print("Today should be \(value)")
}

let val1: String = "beautiful"
let val2: Int = 72

printWeather(value: val1)
printWeather(value: val2)


// generics with type constraints
// ----------------------------------------------------------------------------
// direct methods
func areIntsEqual(first: Int, second: Int) -> Bool {
   return first == second
}
func areStringsEqual(first: String, second: String) -> Bool {
   return first == second
}
let a = 6, b = 7, e = 6
let hi = "hi", hello = "hi", bonjour = "bonjour"

areIntsEqual(first: a, second: b)                  // o: false
areStringsEqual(first: hi, second: hello)          // o: true

// generic method
func areTheseEqual<T: Equatable>(first: T,second: T) -> Bool {
   return first == second
}

areTheseEqual(first: a, second: e)                 // o: true
areTheseEqual(first: hello, second: bonjour)       // o: false

//
//// generics to find uniques
//// ----------------------------------------------------------------------------
//func unique<T: Hashable>(array: [T]) -> [T] {
//   var results = [T: Int]()
//   array.map{results[$0] = 1}
//
//   return results.keys.array
//}
//
//let numbers = [-8, 0, 1, 3, 7, -8, 3]
//let greetings = ["Aloha", "Hello", "Aloha", "Ciao"]
//let bools = [true, false, true]
//
//let uniqueNumbers = unique(numbers)
//let uniqueGreetings = unique(greetings)
//let uniqueBools = unique(bools)
//

// generics types
// ----------------------------------------------------------------------------
struct Stack<T> {
   var items = [T]()
   mutating func push(item: T) {
      items.append(item)
   }
   mutating func pop() -> T? {
      if items.isEmpty {return nil}
      return items.removeLast()
   }}

var myIntStack = Stack<Int>()
var myStringStack = Stack<String>()


// protocol with associated type -----------------------------
protocol Returnable {
   associatedtype ItemType
   var any: ItemType? {get}
   var allObjects: [ItemType] {get}
}

extension Set: Returnable {
   typealias ItemType = T     // inferred from the any: T? implementation
   var any: T? {
      if items.isEmpty {return nil}
      
      let randomNumber = Int(arc4random_uniform(UInt32(items.count)))
      return items[randomNumber]
   }
   var allObjects: [T] {
      return items
   }}

extension Set: Printable {
   var description: String {return "\(items)"}
}

let fish = ["One", "Fish", "Two", "Fish", "Red", "Fish", "Blue", "Fish"]
var set = Set.setWithArray(fish)
set.add("Dr. Seuss")
set.description         // o:



// -----------------------------------------------------------


// ARC -------------------------------------------------------
class Project {
   var name = ""
   var listOfTasks = [Task]()
   deinit {
      print("\(self.name) project is being deinitialized")
   }}

class Task {
   var name = ""
   private var _done = false
   weak var parent:Project?       // keeps memory from leaking
   deinit {
      print("\(self.name) task is being deinitialized")
   }}

var p:Project? = Project()
p!.name = "Cook Dinner"

let taskNames = ["Choose Menu", "Buy Groceries", "Cook Food"]

for name in taskNames {
    let t = Task()
   t.name = name
   t.parent = p
   p!.listOfTasks.append(t)
}

p = nil
// -----------------------------------------------------------


// nested functions (other example)
// ----------------------------------------------------------------------------
func bankVault(passcode:String) -> String {
    func openBankVault() -> String {
        return "Vault opened"
    }
    func closeBankVault() -> String {
        return "Vault closed"
    }
    if passcode == "secret" {
        return openBankVault()
    }
    else {
        return closeBankVault()
    }}

bankVault(passcode: "wrongsecret")               // o: closed
bankVault(passcode: "secret")                    // o: open



// key-value observing (KVO)
// ----------------------------------------------------------------------------
@objc class ObservePerson: NSObject {
    @objc dynamic var name = "Taylor Swift"
}
let taylor = ObservePerson()

taylor.observe(\ObservePerson.name, options: .new) { person, change in
    print("I'm now called \(person.name)")
}

taylor.name = "Justin Bieber"         //o: I'm now called Justin B
