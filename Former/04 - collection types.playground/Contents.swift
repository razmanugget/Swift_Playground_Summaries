import UIKit


// ARRAYS
// ----------------------------------------------------------------------------

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


// retrieval
//  -> Zebra
let animal = array4[2]

// -> A, B, C
print(array3)


// add items
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


// remove items
array2

// all index #'s shift down -> returns 2
array2.remove(at: 0)

// -> returns 6
array2.removeLast()

// removes all, but array stays initialized
array2.removeAll(keepingCapacity: true)
array2 = []


// change items
// overwrites -> .1 = Peaches
array3[1] = "Peaches"

// adds via concatenation -> .1 = Peaches and cream
array3[1] += " and cream"

// overwrites multiple -> Zebra, Fox, Mice
array4[1...2] = ["Fox", "Mice"]


// iterating
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


// multiple type arrays
// -> Array<Any>.Type
var songs: [Any] = ["Rose", "Bud", 3]
type(of: songs)


// miscellaneous functions
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



// Advanced Array Manipulation
// ----------------------------------------------------------------------------

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



// DICTIONARIES
// ----------------------------------------------------------------------------

// declaration - create but don't initialize
var dict1: [String: Int]

// declaration - create/init with 0 value
var dict2: [String: Int] = [:]
var dict3 = [String: Int]()

// create and initialize with initial values
var dict4 = ["AZ":2, "AL":1]


// add & change items
// direct add -> NY, 2
dict3["NY"] = 5

// value changed -> AL, 3
dict4["AL"] = 3

// will insert or change (and return the old value)
dict4.updateValue(7, forKey: "MT")


// remove items
// -> returns 2
dict4.removeValue(forKey: "AZ")

// will remove the pair -> no return
dict4["AL"] = nil

// entire dictionary cleared
dict3 = [:]


// iterating over items
// print keys and values -> key: MT, value: 7
for (key, value) in dict4 {
   print("key: \(key), value:\(value)")
}

// print keys -> key: MT
for key in dict4.keys {
   print("key: \(key)")
}

// print values -> values: 7
for value in dict4.values {
   print("values: \(value)")
}


// miscellaneous
// referencing (no dot notation / unordered) -> optional 7
let state = dict4["MT"]

// count the # of items in the dictionary -> 1
dict4.count

// returns a Bool (true = empty)
dict4.isEmpty


// dictionaries pass by value
var dictA = [1: 1, 2: 2, 3: 3]
var dictB = dictA
dictB[3] = nil

// -> 1: 1, 2: 2, 3: 3
dictA
// -> 1: 1, 2: 2
dictB



// SETS
// ----------------------------------------------------------------------------

// declaration - create/init with 0 value
var set1 = Set<String>()

// create and initialize with initial values
var set2: Set = ["apples","oranges", "straw"]

var set3 = Set<String>()


// add items
set1.insert("apples")

// remove items
set2.remove("oranges")

// remove all items
set3 = []


// -> apples, straw
for fruit in set2 {
   print("\(fruit)")
}


// counting
// count set objects -> 2
set2.count

// count instances in a set - requires NSCountedSet
var NSSet1 = NSCountedSet()
NSSet1 = ["apples","oranges", "straw"]
NSSet1.add("apples")

// -> 3
NSSet1.count
// -> 2
NSSet1.count(for: "apples")


// fundamental set operations
// referencing / contains -> true
let hasItem = set2.contains("apples")

// combining sets (dups are removed) -> apples, straw
set3 = set1.union(set2)

// returning duplicates (intersect) -> apples
let set4 = set1.intersection(set2)

// subtract out values -> straw
let set5 = set2.subtracting(set1)

// show only differences -> straw
let set6 = set1.symmetricDifference(set2)


// membership and equality operations
// are all items unique btwn 2 sets? (t/f) -> false
let isUnique = set1.isDisjoint(with: set2)

// are all 1st set values contained in the 2nd? (t/f) -> true
let isContained = set1.isSubset(of: set2)

// are all 2nd set values contained in the 1st? (t/f) -> false
let isSuper = set1.isSuperset(of: set2)
