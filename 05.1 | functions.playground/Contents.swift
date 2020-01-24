import Cocoa

// MARK: - FUNCTIONS

func greetWorld0(){
   print("Hello World")
}
// nothing returned -> Hello World
greetWorld0()


func greetWorld1() -> String {
   return "Hello World"
}
// returns -> Hello World
greetWorld1()


// parameters
func greetWorld2(name: String) -> String {
   return "Hello \(name)"
}
// -> Hello World
greetWorld2(name: "World")


// multiple parameters
func greetWorld3(greet: String, name: String) {
   print("\(greet) \(name)")
}
// -> Hello World
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
// = (1, 2, 3)
var alpha = thisFuncReturnsATuple()
// -> 1
print(alpha.a)


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
let aBunchOfNumbs = [10,1,4,3,57,43,84,27,156]
let sortedNumbs = sortEvenOdd(numbs: aBunchOfNumbs)

// -> evens [10, 4, 84, 156] odds [1, 3, 57, 43, 27]
print("evens: \(sortedNumbs.evens) odds: \(sortedNumbs.odds)")


// this entire tuple return is an optional
func returnsTupleOpt() -> (a: Int, b: Int)? {
   return (1, 2)
}
// must bind to see -> 1, 2
if let alpha2 = returnsTupleOpt() {
   print(alpha2)
}


// this tuple return contains an optional
func returnSingTuple() -> (a: Int?, b: Int) {
   return (a: nil,b: 2)
}
// no bind needed -> optional 1
var alpha3 = returnSingTuple()
print(alpha3.0 ?? 7)


// passing an optional argument
func grabMidName(name: (String, String?, String)) -> String? {
   return name.1
}
// if nil, then nothing
if let middleName = grabMidName(name: ("Mork", nil, "Ork")) {
   print(middleName)
}


// ignored parameters (_)
func greetIgnore(greet: String, _: String) {
   print("\(greet)")
}
// -> Here comes...
greetIgnore(greet: "Here comes...", "Nothing")


// renaming parameters
func calcArea(argH height: Int, argW width: Int) -> Int {
   return height * width
}
// -> Area = 120
print("Area = \(calcArea(argH: 10, argW: 12))")


// default parameter values  (=)
func add(a: Int = 10, b: Int = 50) -> Int {
   return (a + b)
}
// -> 60
add()
// -> 210
add(b:200)
// -> 299
add(a:99, b:200)

/*
// real world - labels/naming/usage
func downloadImage(for searchResult: SearchResult,
                   withTimeout timeout: TimeInterval,
                   andPlaceOn button: UIButton) {
}

// 3 internal parameter names: searchResult, timeout, button
// method name: downloadImage(for:withTimeout:andPlaceOn:)
// calling the method
downloadImage(for: result, withTimeout: 10, andPlaceOn: imageButton)

*/

// variadic parameter
func addMany(numbers: Int...) -> Int {
   var total = 0
   for number in numbers {
      total += number
   }
   return total
}
// -> 3
addMany(numbers: 1,2)
// -> 28
addMany(numbers: 1,2,3,4,5,6,7)


// overloading functions to accept variadic and array
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

var tupleAdd = average(numbers: 3,5,7,10)               // list of #'s
var arrayAdd = average(numbers: [4,6,8,11])            // array of #'s


// inout parameters variables are passed by reference
func ageUpdate(age: inout Int) {                     // no return needed
   age = age + 1
}

var age = 7
ageUpdate(age: &age)                                       // r: age is now 8
