import Cocoa


// MARK: - OPTIONALS

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

// forced upwrapping with error handling  (*** clean this up ****)
// known as short circuiting -> 2nd condition isn't evaluated unless the first is true
//if location == nil || location!.horizontalAccuracy > newLocation.horizontalAccuracy {
//}


// optional binding (while)
//while isApple == true {
//   print(errorCodeStrg!)                                             // r: optional 404
//   errorCodeStrg = nil
//
//   isApple = false
//}
//print(errorCodeStrg ?? "optional error")                  // r: "opt error"


// implicitly unwrapped optionals (declared w/ !, unwrapped normally)
var assumedInt: Int!
assumedInt = 44
print(assumedInt)                                       // r: 44 (not optional)

// when assigned, assignee still treated as an optional
let implicitInt = assumedInt                     // no need for ! mark
print(implicitInt ?? "optional")               // r: optional 44
print(implicitInt!)                                    // r: 44  (forced unwrapping)

if let boundInt = implicitInt {                  // binding to non-optional
   print(boundInt)                                       // r: 44
}


// Apple Doc example
// forced unwrapping (declared w/ ?, unwrapped w/ !)
var possibleString:String? = "An optional string."

var forcedString = possibleString!           // requires ! mark


// implicitly unwrapped optionals (declared w/ !, unwrapped normally)
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
// regular optional
var maybeString: String? = "Hello Swift"
// ? - signals opt chain
let uppercase = maybeString?.uppercased()

print(maybeString ?? "maybeString is an optional")
print(uppercase ?? "uppercase is still an optional")

// tester is still an optional
let tester = uppercase!                                    // no longer an optional
print(tester)                                                   // will crash if nil

// no value has been assigned
var maybeString2: String?                                 // optional w/ nil value
let uppercase2 = maybeString2?.uppercased()      // = nil

let nextlevel = uppercase2 ?? "nextlevel here"
print(nextlevel)

// optional chaining class example
class Person {
   var dog: Dog?
}

class Dog {
   var name: String
   init(name: String) {self.name = name}
}

let susie = Person()
let dogsName = susie.dog?.name                     // o: nil

susie.dog = Dog(name: "Spot")
let dog2 = susie.dog?.name                         // o: optional "Spot"


// optional chaining with subscripts
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
