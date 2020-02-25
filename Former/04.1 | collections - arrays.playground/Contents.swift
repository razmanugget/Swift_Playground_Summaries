import Cocoa


// MARK: - ARRAYS

// declaration only, cannot append
var array1: [String]

// declaration - create/init with 0 value
var array2 = [Int]()
var array25: [Int] = []

// create and initialize with an initial value (preferred)
var array3 = ["A", "B", "C"]

// declare and populate with repeated values
var array4 = Array(repeating:"Zebra", count:3)

// creating from a dictionary  (can use values also)
let dict0 = [1: "first", 2: "second"]
var array5 = Array(dict0.keys)


// MARK: retrieval
//  -> Zebra
let animal = array4[2]

// -> A, B, C
print(array3)


// MARK: add items
// add 1 item -> 2
array2.append(2)

// add multiple items -> 2, 4, 5
array2.append(contentsOf: [4, 5])

// add a range of Ints -> 2, 4, 5, 1, 2...
array2.append(contentsOf: 1...6)
print(array2)

// shorthand method (+/=)
// adds multiple -> A, B, C, D, E
array3 += ["D", "E"]

// concatenate 2 arrays (index #'s continue after 1st array)
// -> Kiwi, Pears, Kiwi, Pears
array3 += array3

// clears except for item -> Pears
array3 = ["Pears"]

// add at a specific point (insert) -> Kiwi, Pears
array3.insert("Kiwi", at: 0)
print(array3)


// MARK: remove items
array2

// all index #'s shift down -> returns 2
array2.remove(at: 0)

// -> returns 6
array2.removeLast()

// removes all, but array stays initialized
array2.removeAll(keepingCapacity: true)
array2 = []


// MARK: change items
// overwrites -> .1 = Peaches
array3[1] = "Peaches"

// adds via concatenation -> .1 = Peaches and cream
array3[1] += " and cream"

// overwrites multiple -> Zebra, Fox, Mice
array4[1...2] = ["Fox", "Mice"]


// MARK: iterating
// -> Zebra, Bands, Straws
for i in array3 {
   print("i = \(i)")
}

// -> Fruit: Kiwi at: 0...
for index in 0 ..< array3.count {
   print("Fruit: \(array3[index]) at: \(index)")
}

// naming both -> Fruit: Kiwi at: 0...
for (index, fruit) in array3.enumerated() {
   print("Fruit: \(fruit) at: \(index)")
}


// MARK: multiple type arrays
// -> Array<Any>.Type
var songs: [Any] = ["Rose", "Bud", 3]
type(of: songs)


// MARK: miscellaneous functions
// count the # of items -> 0
array2.count

// returns a Bool (true = empty) -> true
array2.isEmpty

// shows if the array contains a certain value (true = yes)
array3.contains("Bandanas")

// assigning value to first|last items
// -> Kiwi
let firstFruit = array3.first
// -> Peaches and cream
let lastFruit = array3.last


// arrays pass by value
var arrayA = [1, 2, 3]
var arrayB = arrayA
arrayB[0] = 10

// -> 1, 2, 3
arrayA
// -> 10, 2, 3
arrayB



// MARK: - Advanced Array Manipulation

// counting frequencies in an array
let items = ["a", "b", "a", "c"]
let mappedItems = items.map { ($0, 1) }
let counts = Dictionary(mappedItems, uniquingKeysWith: +)


// find differences between two arrays with an extension
extension Array where Element: Hashable {
   func difference(from other: [Element]) -> [Element] {
      let thisSet = Set(self)
      let otherSet = Set(other)
      return Array(thisSet.symmetricDifference(otherSet))
   }
}
let names1 = ["John", "Paul", "Ringo"]
let names2 = ["Ringo", "Paul", "George"]
let differenceInArrays = names1.difference(from: names2)
