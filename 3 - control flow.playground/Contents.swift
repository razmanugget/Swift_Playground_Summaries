import UIKit
import Foundation

// CONTROL FLOW
// basic for-in loop
// ----------------------------------------------------------------------------
for i in 1...10 {
	print("i = \(i)")														// o: prints #'s
}

// no counter access, just loops
// ----------------------------------------------------------------------------
for _ in 1...5 {
	print("Hello")															// o: "Hello" 5x
}

var cellContent = [Int]()

for i in 1...50 {
	cellContent.append(i)
}

// prints each name
// ----------------------------------------------------------------------------
let names = ["Jim", "John", "Jill"]
for n in names {
	print(n)																		// o: prints each name
}

// prints each letter
// ----------------------------------------------------------------------------
for i: Character in "Swift".characters {
	print(i)																		// o: prints S w i f t
}


// for in case where loop
// ----------------------------------------------------------------------------
for case let i in 1...100 where i % 3 == 0 {
	print(i)
}


// stride for in loop
// ----------------------------------------------------------------------------
for count in stride(from: 11, to: 1, by: -2) {
	print("\(count)")
}



// while Loop
// ----------------------------------------------------------------------------
var i = 1

while i <= 10 {
	print("i = \(i)")
	i += 1
}


// repeat while Loop
// ----------------------------------------------------------------------------
repeat {
	print("i = \(i)")
	i += 1
} while i <= 10


// if / else statement
// ----------------------------------------------------------------------------
if (1 < 3) {
	print("This is true")						// matches 1st case, then breaks
} else if (1 < 2) {
	print("Yes, but not reached")
} else {
	print("Not true")
}



// SWITCH
// basic switch statement
// ----------------------------------------------------------------------------
var statusCode = 404
var errorString = "The request failed with error:"

switch statusCode {
case 100:
	errorString += " Info, 100."
case 201, 204:																	// compound case
	errorString += " No content 2xx."
case 400...417:																	// range case
	errorString += " Client error, \(statusCode)"
default:
	errorString = "\(statusCode) Unknown. Please try again."
}


// switch with a tuple
// ----------------------------------------------------------------------------
var dogInfo = (7, "Fido")						// the tuple

switch dogInfo {
case (7, "fido"):										// no due to case sensitivity
	"Dat's fido who is 7"
case (7, _):												// "_" -> wildcard
	"Dat dog is 7"
default:
	"Default dog"
}


// switch with value bindings
// ----------------------------------------------------------------------------
switch dogInfo {
case (let age, "Fido"):          // 1st tuple value bound in age
	"Dat's Fido who is \(age)"
case var (age, name):            // replaces default|assigns multiple
	"My dog \(name) is \(age)"
}


// switch with value bindings & where stmt
// ----------------------------------------------------------------------------
switch dogInfo {
case let (age, name) where name == "fido":
	"Is that fido?"
case let (age, name) where age == 7:
	"\(name) is \(age) years old"
default:
	"default dog"
}


// if case & implied where stmt
// ----------------------------------------------------------------------------
let age = 25

if case 18...35 = age, age >= 21 {
	print("Cool demographic and of drinking age")
}

// if case converted to a straight if
// ----------------------------------------------------------------------------
if (age >= 18) && (age <= 35) && (age >= 21) {
	print("Cool demographic and of drinking age")
}

// Control Transfer Statements
// continue
// ----------------------------------------------------------------------------
for i in 1...10 {
	if (i >= 4 && i <= 7) {
		continue
	}
	print(i)																// prints 1, 2, 3, 8, 9, 10
}

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
	switch character {
	case "a", "e", "i", "o", "u", " ":
		continue
	default:
		puzzleOutput.append(character)
	}}

print(puzzleOutput)												// o: grtmndsthnklk


// break
// ----------------------------------------------------------------------------
for i in 1...10 {
	if (i >= 4) && (i <= 7) {
		break
	}
	print(i)																// prints 1, 2, 3
}

switch puzzleOutput {
default:
	break
}


// fallthrough
// ----------------------------------------------------------------------------
var numb = 6

switch numb {
case 0...6:
	print("number")
	fallthrough
default:													// automatically true due to fallthrgh
	print("number above")
}


// labeled statments
// ----------------------------------------------------------------------------
outerLoop: for x in 1...5 {
	innerLoop: for y in 1...3 {
		if y == 2 {
			continue outerLoop
		}
		print("x = \(x), y = \(y)")											// o: x 1-5, y 1
	}}


// guard statment (loop)
// ----------------------------------------------------------------------------
let positiveArray = [1, 2, 3, -4, 5]

for pos in positiveArray {
	guard pos >= 0 else {
		print("\(pos) isn't positive")						// o: -4 isn't positive
		continue									// use break to completely leave the loop
	}
	print("\(pos)")															// o: 1, 2, 3, 5
}


// guard statment (function)
// ----------------------------------------------------------------------------
func greet(person: [String: String]) {
	guard let personName = person["name"] else {
		return
	}
	print("Hello \(personName)")
	
	guard let location = person["location"] else {
		print("I hope the weather is nice near you.")
		return
	}
	print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])


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


