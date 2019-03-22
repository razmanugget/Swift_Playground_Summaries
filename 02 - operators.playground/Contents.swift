import UIKit


// OPERATORS
// ----------------------------------------------------------------------------

// assign a variable
var a = 1
// assign a constant
let b = a							
// assign multiple -> c = 4, d = 5.0
let (c, d) = (4, 5.0)
// assign a tuple -> e.0 = 6, e.1 = 7, e.2 = 8
let e = (6, 7, 8)


// calculations
let quantity = 42
let unitPrice = 34.55
let result = Double(quantity) * unitPrice


// modulus % -> -1
let remainderUnits = -9 % 4

// modulus function -> 1.8
let remainder = 5.0.truncatingRemainder(dividingBy: 3.2)


// comparison
// ----------------------------------------------------------------------------
let x = 100, y = 200

// -> true
let b1 = x < y
// -> false
let b2 = x == y

// -> true
(1, "zebra") < (2, "apple")
// -> true
(3, "apple") < (3, "bird")
// -> true
(4, "dog") >= (4, "dog")


// ternary conditional operator
var pop = 4442
let message = pop < 9999 ? "Small town" : "\(pop) is big!"

var j = 5
j == 5 ? "We're good" : "Oops, not quite"


// nil-coalescing operator
var personalSite: String?
let defaultSite = "http://www.lyfebug.com"

// without ?? operator
var website: String
if personalSite != nil {
	website = personalSite!
} else {
	website = defaultSite
}

// with ?? operator
var website2 = personalSite ?? defaultSite


// check Identity ===
// ----------------------------------------------------------------------------
class C {
	var varX = 1
}

let classOne = C()
let classTwo = C()
let classThree = classOne

if classOne === classTwo {
	print("They're identical.")
} else {
	print("They might be equal, but not identical.")			// o: true
}

if classOne === classThree {
	print("Yes, they refer to the same object.")					// o: true
}


// closed range operator (...)
// ----------------------------------------------------------------------------
var range1 = 1...5

for hello in range1 {
	print("\(hello)")
}


// half-open range operator (..<)
// ----------------------------------------------------------------------------
var someArray = [8,4,3]

for i in 0..<someArray.count {
	print(someArray[i])
}


// logical operators
// ----------------------------------------------------------------------------
let k = true, m = false

let o = k && m											// r: false
let p = k || m											// r: true


// rounding
// ----------------------------------------------------------------------------
let testNumber = -36.98
var roundNumber: Double

roundNumber = round(testNumber)     // o: -37.0 (needs Double)
roundNumber = floor(testNumber)     // o: -37
roundNumber = ceil(testNumber)      // o: -36
roundNumber = trunc(testNumber)     // o: -36

// rounding to specific decimal places
let doubleStr = String(format: "%.1f", testNumber)


// math
// ----------------------------------------------------------------------------
let absolute = abs(testNumber)        // o: 37
(4.0).squareRoot()                    // o: 2
max(5, 10)                            // o: 10
min(-5, -10)                          // o: -10
print(Double.pi)                      // o: 3.141592653589...




