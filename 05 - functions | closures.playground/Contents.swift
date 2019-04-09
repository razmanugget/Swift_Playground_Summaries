import UIKit
import Foundation


// FUNCTIONS
// ----------------------------------------------------------------------------

func greetWorld0(){
	print("Hello World")											
}
// nothing returned -> Hello World
greetWorld0()


func greetWorld1() -> String {
	return "Hello World"
}
// returns -> "Hello World"
greetWorld1()


// parameters
func greetWorld2(name: String) -> String {
	return "Hello \(name)"
}
// -> "Hello World"
greetWorld2(name: "World")


// multiple parameters
func greetWorld3(greet: String, name: String) {
	print("\(greet) \(name)")
}
// -> "Hello World"
greetWorld3(greet: "Hello", name: "World")


// tuples
func greetName0(greet: String, ID: (name:String, age:Int)) {
	print("\(greet) \(ID.name), who is \(ID.age)")
}
// -> Hello Matt, who is 5
greetName0(greet: "Hello", ID: (name:"Matt", age:5))


// multiple named returns (a tuple)
func thisFuncReturnsATuple() -> (a: Int, b: Int, c: Int) {
	return (1,2,3)
}
var alpha = thisFuncReturnsATuple()             // -> (1, 2, 3)
print(alpha.a)                                  // -> 1


// multiple returns - bigger example
func sortEvenOdd(numbs: [Int]) -> (evens: [Int], odds: [Int]) {
	var evens = [Int]()
	var odds = [Int]()
	for i in numbs {
		if i % 2 == 0 {
			evens.append(i)
		} else {
			odds.append(i)
		}}
	return (evens, odds)
}
let aBunchOfNumbs = [10,1,4,3,57,43,84,27,156,111]
let sortedNumbs = sortEvenOdd(numbs: aBunchOfNumbs)
print("evens: \(sortedNumbs.evens) odds: \(sortedNumbs.odds)")


// this entire tuple return is an optional
// ----------------------------------------------------------------------------
func returnsTupleOpt() -> (a: Int, b: Int)? {
	return (1, 2)
}
if let alpha2 = returnsTupleOpt() {						// must bind to see
	print(alpha2)																// -> 1, 2
}


// this tuple return contains an optional
// ----------------------------------------------------------------------------
func returnSingTuple() -> (a: Int?, b: Int) {
	return (a: nil,b: 2)
}
var alpha3 = returnSingTuple()								// no bind needed
print(alpha3.0 ?? 7)                          // -> optional 1


// passing an optional argument
// ----------------------------------------------------------------------------
func grabMidName(name: (String, String?, String)) -> String? {
	return name.1
}
if let middleName = grabMidName(name: ("Mork", nil, "Ork")) {
	print(middleName)												// if nil, then nothing
}


// ignored parameters (_)
// ----------------------------------------------------------------------------
func greetIgnore(greet: String, _: String) {
	print("\(greet)")
}
greetIgnore(greet: "Hello", "Ghost")


// renaming parameters
// ----------------------------------------------------------------------------
func calcArea(argHeight height: Int, argWidth width: Int) -> Int {
	return height * width
}
print("Area = \(calcArea(argHeight: 10, argWidth: 12))")


// default parameter values  (=)
// ----------------------------------------------------------------------------
func add(a: Int = 10, b: Int = 50) -> Int {
	return (a + b)
}
add()																// 10 + 50
add(b:200)													// 10 + 200
add(a:99, b:200)										// 99 + 200


// variadic parameter
// ----------------------------------------------------------------------------
func addMany(numbers: Int...) -> Int {
	var total = 0
	for number in numbers {
		total += number
	}
	return total
}
addMany(numbers: 1,2)															// r: 3
addMany(numbers: 1,2,3,4,5,6,7)										// r: 28


// overloading functions to accept variadic and array
// ----------------------------------------------------------------------------
func average(numbers: [Int]) -> Int {
	var total = 0
	for n in numbers {
		total += n
	}
	return total/numbers.count
}

// converts tuple into array
func average(numbers: Int...) -> Int {
	return average(numbers: numbers)
}

var tupleAdd = average(numbers: 3,5,7,10)					// list of #'s
var arrayAdd = average(numbers: [4,6,8,11])				// array of #'s


// inout parameters variables are passed by reference
// ----------------------------------------------------------------------------
func ageUpdate(age: inout Int) {							// no return needed
	age = age + 1
}

var age = 7
ageUpdate(age: &age)													// r: age is now 8



// ADVANCED FUNCTIONS
// variables typed as parameters
// ----------------------------------------------------------------------------
func doStuff(_ a: String) -> String {
	return "Hi"
}

var stuff: (String) -> String = doStuff

stuff("What?")                                   // -> Hi


// functions typed as parameters
// ----------------------------------------------------------------------------
func addTwoInts(_ a: Int, _ b: Int) -> Int {
	return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
	return a * b
}
var mathFunction: (Int, Int) -> Int = multiplyTwoInts

let anotherMathFunction = addTwoInts
print("\(mathFunction(2, 3))")

func printMathResult(_ mathFunction: (Int, Int) -> Int,
                     _ a: Int, _ b: Int) {
	print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)											// -> 8
printMathResult(multiplyTwoInts, 3, 5)								// -> 15


// functions as return types (apple doc example)
// ----------------------------------------------------------------------------
func stepForward(_ input: Int) -> Int {
	return input + 1
}
func stepBackward(_ input: Int) -> Int {
	return input - 1
}
func chooseStepFunction(backward: Bool) -> ((Int) -> Int) {
	return backward ? stepBackward : stepForward
}
var currentValue = -7

// determines whether to use stepForward/Backward
let moveToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zer->")
while currentValue != 0 {
	print("\(currentValue)... ")
	currentValue = moveToZero(currentValue)
}
print("zero!")


// nested functions (refactored apple example)
// ----------------------------------------------------------------------------
func chooseStepFunction2(backward: Bool) -> ((Int) -> Int) {
	func stepForward(_ input: Int) -> Int {
		return input + 1
	}
	func stepBackward(_ input: Int) -> Int {
		return input - 1
	}
	return backward ? stepBackward : stepForward
}

var currentValue2 = 4

// determines whether to use stepForward/Backward
let moveToZero2 = chooseStepFunction(backward: currentValue2 > 0)

print("Counting to zer->")
while currentValue2 != 0 {
	print("\(currentValue2)... ")
	currentValue2 = moveToZero2(currentValue2)
}
print("zero!")


// nested functions (other example)
// ----------------------------------------------------------------------------
func bankVault(passcode: String) -> String {
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

bankVault(passcode: "wrongsecret")               // -> closed
bankVault(passcode: "secret")                    // -> open

// openBankVault()															// error - not in scope


/*

// function overloading
// ----------------------------------------------------------------------------
class SquareIt {
   func math(num:Int) -> Int {
      return num * num
   }
   func math(num:Double) -> Double {
      return num * num
   }
   func math(num:String) -> String {
      return ("numbers please")
   }}

var squareIt = SquareIt()
squareIt.math(4)           // -> 16
squareIt.math(4.5)         // -> 20.25
squareIt.math("hello")     // -> numbers please


// recursion
// ----------------------------------------------------------------------------
func countDownFrom (ix:Int) {
   print (ix)
   if ix > 0 {
      countDownFrom(ix-1)
   }}

countDownFrom(15)


// function used as a value
// ----------------------------------------------------------------------------
func doThis(f:()->()) {                // signature must match
   f()                                 // passed in function
}

func whatToDo() {                      // signature ()->()
   print("I did it")
}

doThis(whatToDo)


// function used as a value (cleaned up with typealias)
// ----------------------------------------------------------------------------
typealias cleanFunc = () -> ()

func doThis2(f: cleanFunc) {
   f()
}

func whatToDo2() {
   print("I did it")
}

doThis(whatToDo2)
*/



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
// ----------------------------------------------------------------------------
func doMath(a:Int, b:Int, calc:(_ x:Int, _ y:Int) -> Int) -> Int {
	return calc(a, b)
}

doMath(a: 2, b:2, calc:{(a:Int, b:Int) -> Int in return a + b})

doMath(a: 5, b:5, calc:{a, b -> Int in return a * b})

// fully simplified
doMath(a: 10, b:10, calc:{$0 * $1})


// closure counter - within a nested function
// ----------------------------------------------------------------------------
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
	var runningTotal = 0
	func incrementer() -> Int {
		runningTotal += amount					// values captured outside of func
		return runningTotal
	}
	return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

incrementByTen()										// r: 20 (knows to keep separate)


// closure counter - separate (@escaping)
// ----------------------------------------------------------------------------
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

countedGreet()																			// count = 1
countedGreet()																			// count = 2
countedGreet()																			// count = 3

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
// Sorted - returns a sorted array
// --------------------------------------------------------------------------
var randInts = [2, 1, 4, 3]

// sorted - written out as a function
func compareTwo (_ n1:Int, _ n2:Int) -> Bool {
	return n1 > n2
}
var sortedR1 = randInts.sorted(by: compareTwo)


// Sorted - as a closure (full)
// --------------------------------------------------------------------------
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
// Filter - returns array elements that pass a certain condition
// --------------------------------------------------------------------------
var filteredInts = randInts.filter{$0 % 2 == 0}			// -> 2, 4
filteredInts


// map - returns array elements transformed by a function
// --------------------------------------------------------------------------
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
// --------------------------------------------------------------------------
let fruit = "watermelon"

let maxValue = max("orange", "pine", "apple", fruit)
maxValue																				    // -> watermelon

let minValue = min(3.3, 1.1, 2.2, 5.7)
minValue																				    // -> 1.1

// find the max between 3 numbers
let first = 10, second = 15, third = 18
let largest = max(max(first, second), third)        // -> 18


// Reduce - return the sum of array elements
// --------------------------------------------------------------------------
var reducedArray = randInts.reduce(0, +)
reducedArray																	      // -> 10


// Reverse - reverses an array
// --------------------------------------------------------------------------
randInts.reverse()													// -> in-line change


// Sort - in-line sort of values w/in the array
// --------------------------------------------------------------------------
randInts.sort(by: <)													// -> 1, 2, 3, 4


// Sorted - returns a sorted array
// --------------------------------------------------------------------------
let sortedInts = randInts.sorted(by: >)
sortedInts																		// -> 4, 3, 2, 1




