import Cocoa


// MARK: - For / In Loops

// basic -> prints #'s
for i in 1...10 {
   print("i = \(i)")
}

// no counter access, just loops -> Hello 5x
for _ in 1...5 {
   print("Hello")
}

// -> populates an array with 1-50
var cellContent = [Int]()
for i in 1...50 {
   cellContent.append(i)
}

// -> prints each name
let names = ["Jim", "John", "Jill"]
for n in names {
   print(n)
}

// -> prints S w i f t
for i: Character in "Swift" {
   print(i)
}


//  MARK: loop - for in where
// -> 3 6 9 12...
for i in 1...50 where i % 3 == 0 {
   print(i)
}


//  MARK: loop - for in stride
// -> 11 9 7...
for count in stride(from: 11, to: 1, by: -2) {
   print("\(count)")
}


//  MARK: loop - for in reversed
// -> 5 4 3...
for reversedCount in (1...5).reversed() {
   print("\(reversedCount)")
}



// MARK: - While Loop

// -> 1 2 3 (i = 4 at end)
var i = 1
while i <= 3 {
   print("i = \(i)")
   i += 1
}


//  MARK: loop repeat while
// -> 1 2 3 (j = 4 at end)
var j = 1
repeat {
   print("j = \(j)")
   j += 1
} while j <= 3


// MARK: - If / Else Statement
// -> This is true
if (1 < 3) {
   print("This is true")
} else if (1 < 2) {
   print("Yes, but not reached")
} else {
   print("Not true")
}



// MARK: - Switch Statement

// basic switch statement
var statusCode = 404
var errorString = "Error: "

// -> Error: 404
switch statusCode {
case 100:
   errorString += "Info, 100."
// compound case
case 201, 204:
   errorString += "No content 2xx."
// range case
case 400...417:
   errorString += "\(statusCode)"
default:
   errorString = "\(statusCode) Unknown."
}


// MARK: switch with tuple matching
// -> That dog is 7
let dogInfo1 = (7, "Fido")

switch dogInfo1 {
// no, due to case sensitivity
case (7, "fido"):
   "fido is 7"
// "_" -> wildcard
case (7, _):
   "That dog is 7"
default:
   "Default dog"
}


// MARK: switch with value bindings
// -> My dog Maxx is 8
let dogInfo2 = (7, "Max")

switch dogInfo2 {
// 1st tuple value bound to age
case (let age, "max"):
   "That's Max who is \(age)"
// replaces default|assigns multiple
case var (age, name):
   age += 1
   name = "Maxx"
   "My dog \(name) is \(age)"
}


// MARK: value bindings & where clause
// -> Spot is 7
let dogInfo3 = (7, "Spot")

switch dogInfo3 {
case let (_, name) where name == "spot":
   "Is that spot?"
case let (age, name) where age == 7:
   "\(name) is \(age)"
default:
   "default dog"
}


// MARK: if case & implied where stmt
// -> Cool and...
let age = 25

if case 18...35 = age, age >= 21 {
   print("Cool and can drink")
}

// if case converted to a basic if
if (age >= 18) && (age <= 35) && (age >= 21) {
   print("Cool and can drink")
}
