import Cocoa


// MARK: - Comments
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



// MARK: - BOOLS

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



// MARK: - NUMBERS

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



// MARK: - TUPLES

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
