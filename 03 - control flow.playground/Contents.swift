import UIKit
import Foundation

// for / in loops
// ----------------------------------------------------------------------------

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


// loop - for in case where 
// -> 3 6 9 12...
for case let i in 1...50 where i % 3 == 0 {
	print(i)
}


// loop - for in stride 
// -> 11 9 7...
for count in stride(from: 11, to: 1, by: -2) {
	print("\(count)")
}


// loop - for in reversed
// -> 5 4 3...
for reversedCount in (1...5).reversed() {
  print("\(reversedCount)")
}


// while loop
// ----------------------------------------------------------------------------
// -> 1 2 3 (i = 4 at end)
var i = 1
while i <= 3 {
	print("i = \(i)")
	i += 1
}


// loop repeat while
// -> 1 2 3 (j = 4 at end)
var j = 1
repeat {
	print("j = \(j)")
	j += 1
} while j <= 3


// if / else statement
// ----------------------------------------------------------------------------
// -> This is true
if (1 < 3) {
	print("This is true")
} else if (1 < 2) {
	print("Yes, but not reached")
} else {
	print("Not true")
}



// SWITCH
// ----------------------------------------------------------------------------
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


// switch with tuple matching
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


// switch with value bindings
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


// value bindings & where clause
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


// if case & implied where stmt
// -> Cool and...
let age = 25

if case 18...35 = age, age >= 21 {
	print("Cool and can drink")
}

// if case converted to a basic if
if (age >= 18) && (age <= 35) && (age >= 21) {
	print("Cool and can drink")
}

// Control Transfer Statements
// ----------------------------------------------------------------------------

// continue
// -> 1, 2, 3, 8, 9, 10
for i in 1...10 {
	if (i >= 4 && i <= 7) {
		continue
	}
	print(i)
}

// example: remove vowels
// -> grtmndsthnklk
let puzzleInput = "great minds think alike"
var puzzleOutput = ""

for char in puzzleInput {
  switch char {
  case "a", "e", "i", "o", "u", " ":
    continue
  default:
    puzzleOutput.append(char)
  }
}
print(puzzleOutput)												


// break
// -> 1, 2, 3
for i in 1...10 {
  if (i >= 4) && (i <= 7) {
    break
  }
  print(i)
}

switch puzzleOutput {
default:
  break
}


// fallthrough
// -> number above
var numb = 6

switch numb {
case 0...6:
  print("number")
  fallthrough
default:													
  print("number above")
}


// labeled statments
// -> x = 1-5, y = 1
outerLoop: for x in 1...5 {
  innerLoop: for y in 1...3 {
    if y == 2 {
      continue outerLoop
    }
    print("x = \(x), y = \(y)")
  }
}


// guard statment (loop)
// ----------------------------------------------------------------------------
// in a loop -> 1, 2, 3, -4 isn't positive, 5
let positiveArray = [1, 2, 3, -4, 5]

for pos in positiveArray {
	guard pos >= 0 else {
		print("\(pos) isn't positive")
		continue
	}
	print("\(pos)")
}

// in a function -> 
func greet(person: String) {
	guard let personName = person as? String else {
    print("Hello \(personName)")
		return
	}

}

greet(person: nil)
greet(person: "John")



//// in a function -> 
//func greet(person: [String: String]) {
//  guard let personName = person["name"] else {
//    return
//  }
//  print("Hello \(personName)")
//  
//  guard let location = person["location"] else {
//    print("I hope the weather is nice near you.")
//    return
//  }
//  print("I hope the weather is nice in \(location).")
//}
//
//greet(person: ["name": "John"])
//greet(person: ["name": "Jane", "location": "Cupertino"])


// early function exit if a condition is not met (guard)
// ----------------------------------------------------------------------------
func greetMidName(name: (ft: String, mid: String?, last: String)) -> Int {
	guard name.mid != nil else {
		print("Hey there")
		return 0
	}
	return 1
}
greetMidName(name: ("Matt", nil, "Mathias"))


/*
// guard statment - place in a Project to avoid errors
// ----------------------------------------------------------------------------
func sendToServer(name: String, address: String) {
	print("sending stuff")
}

func guardSubmit() {
	guard let name = nameField.text else {
		print("No name to submit")
		return
	}
	guard let address = address.Field.text else {
		print("No address to submit")
		return
	}
	sendToServer(name, address: String)
}

// without guard statment - place in a Project to avoid errors
func nonguardSubmit() {
	if let name = nameField.text {						// pyramid of doom
		if let address = addressField.text {		// just starting here
			sendToServer(name, address: address)
		} else {
			print("no address to submit")
		}
	} else {
		print("no name to submit")
	}
}
*/


