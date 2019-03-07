import UIKit


// comments

// ----------------------------------------------------------------------------
// this is a single line comment
/*
		this is a multi-line comment
*/


// landmarks
// ----------------------------------------------------------------------------
// MARK: -
// MARK: - <Title> -
// TODO: <Title>
// FIXME: <Title>


// Markdown example
// ----------------------------------------------------------------------------
/// # nada - The useless method
/// ---
/// This method really doesn't do anything at all useful.
/// It's in the application purely as an example.
/// - Parameter this:String describing this
/// - Parameter that:String describing that
/// - Returns : 1
/// - Throws : Tons of errors
/// ```swift
/// let one = nada("blah", "blah")
/// NSLog("\(one)")
func nada(this: NSString , that: NSString ) -> Int {
  return (1)
}



// BOOLS
// declaration
// ----------------------------------------------------------------------------
var isOrange: Bool                  // create but don't initialize

// create and initialize with an initial value
var isApple = true



// NUMBERS
// declaration
// ----------------------------------------------------------------------------
var myVariable1: Int                // create but don't initialize
var myVariable2 = Int()             // create/init with a 0/"" value

// create and initialize with an initial value
var myVariable3 = 24                // preferred

// create multiple variables
var yes = 0, no = 0


// notation
// ----------------------------------------------------------------------------
let binaryNotation = 0b110011         // o: 51 prefix with 0b
let octalNotation = 0o12              // o: 10 prefix with 0o
let hexadecimalNotation = 0x32        // o: 50 prefix with 0x

let scientificNotation = 4.4e-7       // o: suffix with e-
let longNumber = 1_000_000            // optional _ = easier to read



// STRINGS
// declaration
// ----------------------------------------------------------------------------
var myString1: String               // create but don't initialize
var myString2 = String()            // create/init with a 0/"" value

// create and initialize with an initial value
var myChar: Character = "!"
var myString3 = "Hello"             // preferred

// create multiple variables
var animal = "bear", bird = "crane"


// combining
// ----------------------------------------------------------------------------
var greeting = "Hello, "
var cat = "Whiskers meow meow"

print (greeting + cat + ".")            // concatenation
cat.append(myChar)						// concatenation with char
print ("My cat's name is \(cat)")		// interpolation
greeting += cat                         // add & assign to existing string


// multi-line
// ----------------------------------------------------------------------------
let longString = """
When you write a string that spans multiple
lines make sure you start its content on a
line all of its own, and end it with three
quotes also on a line of their own.
Multi-line strings also let you write "quote marks"
freely inside your strings, which is great!
"""

print(longString)


// iterating thru each character of name
// ----------------------------------------------------------------------------
for catChars in cat {
  print(catChars)                       // prints -> Whiskers meow meow!
}

let reversed = String(cat.reversed())   // reverses letters


// formatting decimals with Strings
// ----------------------------------------------------------------------------
let angle = 45.6789
let formatted = String(format: "Angle: %.2f", angle)


// search w/in a string
// ----------------------------------------------------------------------------
var bookTitle = "2000 Leagues Under the Sea"

if bookTitle.range(of: "sea") != nil {
  print("The word \("Sea") appears in \(bookTitle)")
}
if bookTitle.range(of: "sea", options: .caseInsensitive) != nil {
  print("The word \("Sea") appears in \(bookTitle)")
}


// search w/in a string and replace
// ----------------------------------------------------------------------------
var bigStr = "  Tay lor  "
bigStr.replacingOccurrences(of: " ", with: "")  // o: Taylor

// for just beg/end use    o: Tay lor
let trimmed = bigStr.trimmingCharacters(in: .whitespacesAndNewlines)
trimmed


// identify suffixes/prefixes
// ----------------------------------------------------------------------------
if bookTitle.hasPrefix("2000") {
	print("number first")
}

if bookTitle.hasSuffix("Sea") {
	print("Sea at end")
}


// separating strings based on components
// ----------------------------------------------------------------------------
var titleBreakdown = bookTitle.components(separatedBy: " ")
print(titleBreakdown)					// = array: 2000, Leagues, Under..


// select characters
// ----------------------------------------------------------------------------
let newSubString = NSString(string: bookTitle)

newSubString.substring(to: 4)					// o: 2000
newSubString.substring(from: 13)			// o: Under the Sea

// selecting a range  o: Under
newSubString.substring(with: NSRange(location: 13, length: 5))
NSString(string: newSubString.substring(from: 13)).substring(to: 5)


// other String methods
// ----------------------------------------------------------------------------
// counting characters
var nameNum = (cat.count)         // result -> 19 characters

// confirm contents
if cat.isEmpty {
  print("no cat here")
}

// change case
cat.uppercased()                  // converts all chars to upper
cat.lowercased()                  // converts all chars to lower
cat.capitalized                   // capitalize each char before a space



// TUPLES
// assigning
// ----------------------------------------------------------------------------
let rectangle1 = (200, 100)
var rectangle2 = (width:200, height:100)     // with names


// decomposing (option 1 - .dot syntax or name)
// ----------------------------------------------------------------------------
rectangle1.1                                 // .0=200, .1=100
rectangle2.width                             // o: 200

// decomposing (option 2 - let a variable = tuple)
let (a, b) = rectangle1                      // a = 200, b = 100
let (_, e) = rectangle2                      // "_" -> ignore values

print("a = \(a) and e = \(e)")               // o: 200, 100


// function returning a tuple
// ----------------------------------------------------------------------------
func getSongAndDuration() -> (name:String, length:Int?) {
  return("Moonlight in Vermont", 210)
}


// assignment of a tuple from a function
// ----------------------------------------------------------------------------
let (name, length) = getSongAndDuration()

print("The song is \(name) and it's \(length ?? 90) seconds long")



// OPTIONALS
// creation (?)
// ----------------------------------------------------------------------------
var errorCodeStrg: String?									// optional creation

// access by including a default value to prevent nil
print(errorCodeStrg ?? "default value")     // r: "default value"


// auto created optional
let possibleError = "123"
let convertedError = Int(possibleError)

print(convertedError!)											// r: 123 (not optional)


// forced unwrapping (!) when you know a value is present
// ----------------------------------------------------------------------------
errorCodeStrg = "404"
print(errorCodeStrg!)												// r: forced unwrap = "404"

// forced unwrapping (!) with checking for nil
if errorCodeStrg != nil {
  print(errorCodeStrg!)											// forced unwrap r: "404"
}


// optional binding (if let ,)
// ----------------------------------------------------------------------------
if let errorCodeStrg = errorCodeStrg, possibleError == "123" {
  print(errorCodeStrg)															// r: 404
}


// optional binding (while)
// ----------------------------------------------------------------------------
while isApple == true {
	print(errorCodeStrg!)															// r: optional 404
	errorCodeStrg = nil
	
	isApple = false
}
print(errorCodeStrg ?? "optional error")						// r: "opt error"


// implicitly unwrapped optionals (declared w/ !, unwrapped normally)
// ----------------------------------------------------------------------------
var assumedInt: Int!
assumedInt = 44
print(assumedInt)													// r: 44 (not optional)

// when assigned, assignee still treated as an optional
let implicitInt = assumedInt							// no need for ! mark
print(implicitInt ?? "optional")					// r: optional 44
print(implicitInt!)												// r: 44  (forced unwrapping)

if let boundInt = implicitInt {						// binding to non-optional
	print(boundInt)													// r: 44
}


// Apple Doc example
// forced unwrapping (declared w/ ?, unwrapped w/ !)
// ----------------------------------------------------------------------------
var possibleString:String? = "An optional string."

var forcedString = possibleString!           // requires ! mark


// implicitly unwrapped optionals (declared w/ !, unwrapped normally)
// ----------------------------------------------------------------------------
var assumedString:String! = "An implicitly unwrapped optional string."

let implicitString = assumedString           // no need for ! mark

assumedString = "No longer an optional - No extra formatting to unwrap is needed to change"
print (implicitString ?? "default value here")



// optional chaining
// ----------------------------------------------------------------------------
//let firstParentRecognizer = view.superview?.gestureRecognizers?.first
//
//// avoids this
//if let superview = view.superview {
//  if let recognizers = superview.gestureRecognizers {
//    let firstParentRecognizer = recognizers.first
//  }
//}


// optional chaining
// ----------------------------------------------------------------------------
var maybeString: String? = "Hello Swift"      // regular optional
let uppercase = maybeString?.uppercased() 		// ? - signals opt chain

print(maybeString ?? "maybeString is an optional")
print(uppercase ?? "uppercase is still an optional")

// tester is still an optional
let tester = uppercase!												// no longer an optional
print(tester)																	// will crash if nil

// no value has been assigned
var maybeString2: String?											// optional w/ nil value
let uppercase2 = maybeString2?.uppercased()		// = nil

let nextlevel = uppercase2 ?? "nextlevel here"
print(nextlevel)

// optional chaining class example
// ----------------------------------------------------------------------------
class Person {
	var dog: Dog?
}

class Dog {
	var name: String
	init(name: String) {self.name = name}
}

let susie = Person()
let dogsName = susie.dog?.name      					// o: nil

susie.dog = Dog(name: "Spot")
let dog2 = susie.dog?.name          					// o: optional "Spot"
 
 
 // optional chaining with subscripts
 // ----------------------------------------------------------------------------
 class Site {
 var title: String
 var libraries: [Library]?
 
 init(title:String) {self.title = title}
 }
 
 class Library {
 var title: String
 var documents: [Document]?
 
 init(title: String) {self.title = title}
 }
 
 class Document {
 var title: String
 
 init(title: String) {self.title = title}
 }
 
 // creating the doc libary instance and linking to site
 // ----------------------------------------------------------------------------
 let acctSite = Site(title: "Accounting")
 let auditLibrary = Library(title: "Audit Library")
 acctSite.libraries = []
 acctSite.libraries?.append(auditLibrary)
 
 
 
 // creating the doc and adding it to Audit Library
 // ----------------------------------------------------------------------------
 let auditDoc = Document(title: "Auditing")
 auditLibrary.documents = []
 auditLibrary.documents?.append(auditDoc)
 
 let docName = acctSite.libraries?[0].documents?[0].title
 
 if let name = docName {
 print("Document name is \(name).")
 } else {
 print("Could not retrieve document name.")
 }


// nil coalescing operator (??)
// ----------------------------------------------------------------------------
var personalSite:String?
let defaultSite = "http://www.lynda.com"

// without ?? operator
var website:String
if personalSite != nil {
  website = personalSite!
} else {
  website = defaultSite
}

// with ?? operator
var website2 = personalSite ?? defaultSite

/* 
 // working with Obj-C arrays
 // ----------------------------------------------------------------------------
 var whatVar:Any
 
 whatVar = 7
 whatVar = "test"
 
 
 // AnyObject example uses
 // ----------------------------------------------------------------------------
 func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject){}
 
 func touchDigit2(sender: AnyObject)
 {}
 
 
 // AnyObject conversion
 // ----------------------------------------------------------------------------
 class StringClass {}
 
 let ao: AnyObject = "random"
 
 if let foo = ao as? StringClass {
 }
 
 /*
 // AnyObject hooked up to a button & slider
 // ----------------------------------------------------------------------------
 @IBAction func touchDigit(sender: AnyObject) {
 if let sendingButton = sender as? UIButton {
 let digit = sendingButton.currentTitle!
 } else if let sendingSlider = sender as? UISlider {
 let digit = String(Int(sendingSlider.value))
 }
 }
 */
 
 
 // AnyObject used with NSUserDefaults
 // ----------------------------------------------------------------------------
 let defaults = NSUserDefaults.standardUserDefaults()
 
 let plist = defaults.objectForKey("foo")      // plist = AnyObject
 defaults.setObject(plist, forKey: "foo")
 */

