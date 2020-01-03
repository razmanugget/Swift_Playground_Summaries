import Cocoa


// MARK: - guard statment (loop)

// in a loop -> 1, 2, 3, -4 isn't positive, 5
let positiveArray = [1, 2, 3, -4, 5]

for pos in positiveArray {
   guard pos >= 0 else {
      print("\(pos) isn't positive")
      continue
   }
   print("\(pos)")
}


// in a function -> optional parameter
func greet(person: String?) {
   guard let personName = person else {
      print ("Hey no name")
      return
   }
   print("Hello \(personName)")
}

// -> Hello John
greet(person: "John")
// -> Hey no name
greet(person: nil)


// early function exit if a condition is not met (guard)
func greetLastName(name: (first: String, last: String?)) -> Int {
   guard name.last != nil else {
      print("Last name required")
      return 0
   }
   return 1
}

// -> Last name required, exit with return 0
greetLastName(name: ("Matt", nil))




// guard statment - place in a Project to avoid errors
// ----------------------------------------------------------------------------
//func sendToServer(name: String, address: String) {
//   print("sending stuff")
//}
//
//func guardSubmit() {
//   guard let name = nameField.text else {
//      print("No name to submit")
//      return
//   }
//   guard let address = addressField.text else {
//      print("No address to submit")
//      return
//   }
//   sendToServer(name: name, address: address)
//}
//
//// without guard statment - place in a Project to avoid errors
//func nonguardSubmit() {
//   // pyramid of doom starts here
//   if let name = nameField.text {
//      if let address = addressField.text {
//         sendToServer(name: name, address: address)
//      } else {
//         print("no address to submit")
//      }
//   } else {
//      print("no name to submit")
//   }
//}
