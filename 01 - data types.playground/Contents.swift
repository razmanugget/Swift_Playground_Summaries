import UIKit

// ----------------------------------------------------------------------------

// comments
// this is a single line comment
/*
   this is a multi-line comment
*/


// landmarks
// MARK: -
// MARK: - <Title> -
// TODO: <Title>
// FIXME: <Title>


// Markdown example
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

// click nada while holding option key
func nada(this: NSString , that: NSString ) -> Int {
   return (1)
}



// BOOLS
// ----------------------------------------------------------------------------

// declaration - create but don't initialize
var isOrange: Bool

// create and initialize with an initial value
var isApple = true

// determine equality and assign value to constant -> false
let guess = "dog"
let dogEqualsCat = guess == "cat"

// -> false
let myAge = 30
let isTeenager = myAge >= 13 && myAge <= 19


// toggle a state change -> false
var switchState = true
switchState.toggle()



// NUMBERS
// ----------------------------------------------------------------------------

// declaration - create but don't initialize
var myVariable1: Int

// declaration - create/init with 0 value
var myVariable2 = Int()

// create and initialize with an initial value (preferred)
var myVariable3 = 24

// create multiple variables
var yes = 0, no = 0


// notation
// -> 51 prefix with 0b
let binaryNotation = 0b110011
// -> 10 prefix with 0o
let octalNotation = 0o12
// -> 50 prefix with 0x
let hexadecimalNotation = 0x32

// -> suffix with e-
let scientificNotation = 4.4e-7
// optional _ = easier to read
let longNumber = 1_000_000



// STRINGS
// ----------------------------------------------------------------------------

// declaration - create but don't initialize
var myString1: String

// declaration - create/init with 0 value
var myString2 = String()

// create and initialize with an initial value (preferred)
var myChar: Character = "!"
var myString3 = "Hello"

// create multiple variables
var animal = "bear", bird = "crane"


// combining
var greeting = "Hello, "
var cat = "Whiskers meow meow"

// concatenation
print(greeting + cat + ".")

// concatenation with char
cat.append(myChar)

// interpolation
print("My cat's name is \(cat)")

// add & assign to existing string
greeting += cat


// multi-line
let longString = """
When you write a string that spans multiple
lines make sure you start its content on a
line all of its own, and end it with three
quotes also on a line of their own.
Multi-line strings also let you write "quote marks"
freely inside your strings, which is great!
"""
print(longString)


// iterating thru each character of name -> F i d o
let dogName = "Fido"
for dogChars in dogName {
   print(dogChars)
}

// reversing -> odiF
let reversed = String(dogName.reversed())


// formatting decimals with Strings
let angle = 45.6789
let formatted = String(format: "Angle: %.2f", angle)


// search
// search w/in a string
var bookTitle = "  War and Peace  "

// -> false (case sensitive)
if bookTitle.range(of: "war") != nil {
   print("war appears in the title")
}

// -> true (case insensitive)
if bookTitle.range(of: "peace", options: .caseInsensitive) != nil {
   print("peace appears in the title")
}

// identify suffix -> true
if bookTitle.hasPrefix("War") {
   print("War first")
}

// identify prefix -> true
if bookTitle.hasSuffix("Peace") {
   print("Peace at end")
}

// search and replace -> WarandPeace
bookTitle.replacingOccurrences(of: " ", with: "")

// for just beg/end use -> War and Peace
let trimmedTitle = bookTitle.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmedTitle)


// separating strings based on components
// -> array: "War", "and", "Peace"
var titleBreakdown = trimmedTitle.components(separatedBy: " ")
print(titleBreakdown)


// select characters
let newSubString = NSString(string: "War and Peace")

// -> War
newSubString.substring(to: 3)

// -> ace
newSubString.substring(from: 10)

// selecting a range -> "and"
newSubString.substring(with: NSRange(location: 4, length: 3))

// combined conversion and selection -> "and"
NSString(string: newSubString.substring(from: 4)).substring(to: 3)


// other String methods
let mouseName = "Mickey"

// counting characters-> 6
var nameNum = (mouseName.count)

// confirm contents
if mouseName.isEmpty {
   print("no mouse in here")
}

// change case
mouseName.uppercased()
mouseName.lowercased()

// capitalize each char before a space
mouseName.capitalized                   



// TUPLES
// ----------------------------------------------------------------------------

// declaration - create but don't initialize
var rectangle0: (Int, Int)

// create and initialize with initial values
let rectangle1 = (200, 100)

// create and initialize with initial values and names (preferred)
var rectangle2 = (width:200, height:100)


// decompose with .dot syntax -> 100
rectangle1.1
// decompose with name -> 200
rectangle2.width

// -> a = 200, b = 100
let (a, b) = rectangle1
let (_, e) = rectangle2

print("a = \(a) and e = \(e)")


// function returning a tuple
func getSongAndLength() 
   -> (name: String, length: Int?) {
      return ("Centerfold", 200)
}

// assignment of a tuple from a function
let (name, length) = getSongAndLength()
print("The song is \(name) and it's \(length ?? 90) seconds long")



// OPTIONALS
// ----------------------------------------------------------------------------

// initialization (?)
var errorCodeStrg: String?

// access by including a default value to prevent nil -> default value
print(errorCodeStrg ?? "default value")


// auto created optional
let possibleError = "123"
let convertedError = Int(possibleError)

// -> 123 (not optional)
print(convertedError!)


// forced unwrapping (!) when you know a value is present
errorCodeStrg = "404"
// -> forced unwrap = "404"
print(errorCodeStrg!)

// forced unwrapping (!) with checking for nil -> forced unwrap r: "404"
if errorCodeStrg != nil {
   print(errorCodeStrg!)
}


// optional binding (if let ,) -> 404
if let errorCodeStrg = errorCodeStrg, possibleError == "123" {
   print(errorCodeStrg)
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
print(implicitString ?? "default value here")



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
let defaultSite = "http://www.lyfebug.com"

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
