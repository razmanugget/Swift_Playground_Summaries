import Cocoa

// ADVANCED FUNCTIONS
// ----------------------------------------------------------------------------

// variables typed as parameters
func doStuff(_ a: String) -> String {
   return "Hi"
}

var stuff: (String) -> String = doStuff

stuff("What?")                                   // -> Hi


// functions typed as parameters
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

// -> 8
printMathResult(addTwoInts, 3, 5)
// -> 15
printMathResult(multiplyTwoInts, 3, 5)


// functions as return types (apple doc example)
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

// openBankVault()                                             // error - not in scope



// function overloading
// ----------------------------------------------------------------------------
//class SquareIt {
//   func math(num:Int) -> Int {
//      return num * num
//   }
//   func math(num:Double) -> Double {
//      return num * num
//   }
//   func math(num:String) -> String {
//      return ("numbers please")
//   }}
//
//var squareIt = SquareIt()
//squareIt.math(4)           // -> 16
//squareIt.math(4.5)         // -> 20.25
//squareIt.math("hello")     // -> numbers please
//
//
//// recursion
//// ----------------------------------------------------------------------------
//func countDownFrom (ix:Int) {
//   print (ix)
//   if ix > 0 {
//      countDownFrom(ix-1)
//   }}
//
//countDownFrom(15)
//
//
//// function used as a value
//// ----------------------------------------------------------------------------
//func doThis(f:()->()) {                // signature must match
//   f()                                 // passed in function
//}
//
//func whatToDo() {                      // signature ()->()
//   print("I did it")
//}
//
//doThis(whatToDo)
//
//
//// function used as a value (cleaned up with typealias)
//// ----------------------------------------------------------------------------
//typealias cleanFunc = () -> ()
//
//func doThis2(f: cleanFunc) {
//   f()
//}
//
//func whatToDo2() {
//   print("I did it")
//}
//
//doThis(whatToDo2)
