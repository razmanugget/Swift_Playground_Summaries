import Cocoa


// MARK: - STRINGS

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


//  MARK: search
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
