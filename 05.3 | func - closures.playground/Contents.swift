import Cocoa

// CLOSURES
// ----------------------------------------------------------------------------

// a simple closure is defined here (like a func)
let myClosure = {
   print("This is a simple function.")
}

// function that accepts a closure as a parameter
func perform5Times(myClosureParam: ()->() ) {
   for _ in 1...5 {
      myClosureParam()
   }}

// referencing the simple closure
perform5Times(myClosureParam: myClosure)


// the closure is wrapped up inside here
perform5Times(myClosureParam: { ()->() in
   print("The full closure is enclosed here.")
})


// reducing a closure to its simplest terms
func doMath(a:Int, b:Int, calc:(_ x:Int, _ y:Int) -> Int) -> Int {
   return calc(a, b)
}

doMath(a: 2, b:2, calc:{(a:Int, b:Int) -> Int in return a + b})

doMath(a: 5, b:5, calc:{a, b -> Int in return a * b})

// fully simplified
doMath(a: 10, b:10, calc:{$0 * $1})


// closure counter - within a nested function
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
   var runningTotal = 0
   func incrementer() -> Int {
      runningTotal += amount               // values captured outside of func
      return runningTotal
   }
   return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

incrementByTen()                              // r: 20 (knows to keep separate)


// closure counter - separate (@escaping)
func countAdder(ca:@escaping ()->()) -> () -> () {
   var ct = 0
   return {
      ct += 1
      print("count is \(ct)")
      ca()
   }}
func greet() {
   print("howdy")
}
let countedGreet = countAdder(ca: greet)

countedGreet()                                                         // count = 1
countedGreet()                                                         // count = 2
countedGreet()                                                         // count = 3

/*
 // closure (@noescape)
 // ----------------------------------------------------------------------------
 func nonescapingClos(closure: @noescape () -> Void) {
 closure()
 }
 var completionHandlers: [() -> Void] = []
 
 func escapingClos(completionHandler: () -> Void) {
 completionHandlers.append(completionHandler)
 }
 
 class SomeClass {
 var x = 10
 func doSomething() {
 nonescapingClos { x = 200 }
 escapingClos { self.x = 100 }
 }
 }
 
 let instance = SomeClass()
 instance.doSomething()
 print(instance.x)
 
 completionHandlers.first?()
 print(instance.x)
 
 
 
 // autoclosure (@autoclosure)
 // ----------------------------------------------------------------------------
 var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
 print(customersInLine.count)
 // Prints "5"
 
 let customerProvider = { customersInLine.remove(at: 0) }
 print(customersInLine.count)
 // Prints "5"
 
 print("Now serving \(customerProvider())!")
 // Prints "Now serving Chris!"
 print(customersInLine.count)
 
 // customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
 func serve(customer customerProvider: () -> String) {
 print("Now serving \(customerProvider())!")
 }
 serve(customer: { customersInLine.remove(at: 0) } )
 */


// CLOSURES - BREAKDOWN
// --------------------------------------------------------------------------

// Sorted - returns a sorted array
var randInts = [2, 1, 4, 3]

// sorted - written out as a function
func compareTwo (_ n1:Int, _ n2:Int) -> Bool {
   return n1 > n2
}
var sortedR1 = randInts.sorted(by: compareTwo)


// Sorted - as a closure (full)
let sortedR2 = randInts.sorted(by: {(n1:Int, n2:Int) -> Bool in return n1 < n2})

// sorted - closure inferring type from context
let sortedR3 = randInts.sorted(by: {n1, n2 in return n1 < n2})

// sorted - closure with implicit return
let sortedR4 = randInts.sorted(by: {n1, n2 in n1 < n2})

// sorted - closure with shorthand argument names
let sortedR5 = randInts.sorted(by: {$0 < $1})

// Sorted - simplified since operator only takes 2 parameters (final)
// --------------------------------------------------------------------------
let sortedR6 = randInts.sorted(by: <)



// CLOSURES - BUILT-IN
// --------------------------------------------------------------------------

// Filter - returns array elements that pass a certain condition
var filteredInts = randInts.filter{$0 % 2 == 0}         // -> 2, 4
filteredInts


// map - returns array elements transformed by a function
var mapDouble = randInts.map{$0 * 2}
mapDouble                                           // -> 4, 2, 8, 6

// map - with string interpolation
var mapMoney = randInts.map{"\($0)€"}
mapMoney                                            // -> 2€, 1€

// mapValues
let peopleMetric = ["Taylor": 178.0, "Justin": 175.0, "Ed": 173.0]
let peopleImperial = peopleMetric.mapValues { $0 / 2.54 }
peopleImperial                     // -> ed, 68; taylor, 70; justin 69

// compactMap - remove nil values
let numbers = ["1", "2", "Fish"]
let integers = numbers.compactMap { Int($0) }
integers                                            // -> 1, 2


// Max & Min - return the highest/lowest value from a list
let fruit = "watermelon"

let maxValue = max("orange", "pine", "apple", fruit)
maxValue                                                                // -> watermelon

let minValue = min(3.3, 1.1, 2.2, 5.7)
minValue                                                                // -> 1.1

// find the max between 3 numbers
let first = 10, second = 15, third = 18
let largest = max(max(first, second), third)        // -> 18


// Reduce - return the sum of array elements
var reducedArray = randInts.reduce(0, +)
reducedArray                                                         // -> 10


// Reverse - reverses an array
randInts.reverse()                                       // -> in-line change


// Sort - in-line sort of values w/in the array
randInts.sort(by: <)                                       // -> 1, 2, 3, 4


// Sorted - returns a sorted array
let sortedInts = randInts.sorted(by: >)
sortedInts                                                      // -> 4, 3, 2, 1

