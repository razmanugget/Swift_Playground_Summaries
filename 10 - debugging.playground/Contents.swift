import UIKit


// Debugging
// print stmt
// ----------------------------------------------------------------------------
print("I'm inside the viewDidLoad() method!")



// assertions (assert)
// ----------------------------------------------------------------------------
let asseAge = 3
assert(asseAge >= 0, "Nope")

func mySlowMethodTest() -> Bool {
  return true
}
assert(mySlowMethodTest() == true, "slow method = false")


// enum with the error conditions (Error)
// ----------------------------------------------------------------------------
enum MyErrors: Error {
  case littleError
  case bigError(String)
}


// function that tests for errors (throws|guard|throw)
// ----------------------------------------------------------------------------
func doSomething() throws -> String {
  guard asseAge >= 5 else { throw MyErrors.littleError }
  return "doing stuff"
}


// finally testing for errors
// ----------------------------------------------------------------------------
do {
  try doSomething()
} catch MyErrors.littleError {
  print("little error caught")
} catch MyErrors.bigError {
  print("big one")
}


// defer statement (defer)
// ----------------------------------------------------------------------------
func myFunc() {
  print("Step 1")
  defer { print("Step 3") }
  print("Step 2")
}
myFunc()



/*
 let myDate: NSDate = NSDate . distantFuture () as NSDate
 // other error handling example
 // ------------------------------------------------------------------------
 func encryptString(str: String, withPassword password: String) throws -> String {
 guard password.characters.count > 0 else { throw EncryptionError.Empty }
 guard password.characters.count >= 5 else { throw EncryptionError.Short }
 // complicated encryption goes here
 let encrypted = password + str + password
 return String(encrypted.characters.reverse())
 }
 
 let encrypted = try encryptString("secret information!", withPassword: "12345")
 
 enum EncryptionError: ErrorType {
 case Empty
 case Short
 }
 
 
 do {
 let encrypted = try encryptString("secret information!", withPassword: "")
 print(encrypted)
 } catch EncryptionError.Empty {
 print("You must provide a password.")
 } catch EncryptionError.Short {
 print("Passwords must be at least five characters, preferably eight or more.")
 } catch {
 print("Something went wrong!")
 }
 */

