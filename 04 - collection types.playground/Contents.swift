import UIKit


// ARRAYS
// ----------------------------------------------------------------------------

// declare only
var array1: [String]															// cannot append

// declare and initialize
var array2 = [Int]()															// empty
var array25: [Int] = []														// works but longer

// declare and populate using inferred type
var array3 = ["A", "B", "C"]											// preferred

// declare and populate with repeated values
var array4 = Array(repeating:"Zebra", count:3)

// creating from a dictionary  (can use values also)
let dict0 = [1: "first", 2: "second"]
var array5 = Array(dict0.keys)										// o: 2, 1 (random)


// retrieval
// ----------------------------------------------------------------------------
let animal = array4[2]														// r: Zebra
print(array3)																			// o: A, B, C

var songs2: [String] = []
songs2.append("Shake it Off")

// add items (append, insert)
// ----------------------------------------------------------------------------
array2.append(2)														// add 1 item
array3.append("D")													// add 1 item
array2.append(contentsOf: [4, 5])						// add multiple items
array2.append(contentsOf: 1...6)						// add a range of Ints

// shorthand method (+/=)
array3 += ["E", "F"]												// adds multiple
array3 = ["Pears"]													// clears except for item

// add at a specific point (insert)
array3.insert("Pineapples", at: 0)

// concatenate 2 arrays (index #'s continue after 1st array)
array3 += array3


// remove items
// ----------------------------------------------------------------------------
array2

// all index #'s shift down
array2.remove(at: 0)										// o: returns the item removed

// the removed item is returned. a new var can = it
array2.removeLast()											// o: returns the item removed

// removes all, but array stays initialized
array2.removeAll(keepingCapacity: true)
array2 = []


// change items
// ----------------------------------------------------------------------------
array3[1] = "Peaches"												// overwrites
array3[1] += " and cream"										// adds via concatenation
array3[2...3] = ["Bandanas", "Straws"]			// overwrites multiple


// iterating
// ----------------------------------------------------------------------------
for i in array3 {
	print("i = \(i)")
}

for index in 0 ..< array3.count {
	print("The fruit is \(array3[index]) at index: \(index)")
}

for (index, fruit) in array3.enumerated() {
	print("The fruit is \(fruit) at index: \(index)")
}


// multiple type arrays
// ----------------------------------------------------------------------------
var songs: [Any] = ["Rose", "Bud", 3]
type(of: songs)


// miscellaneous functions
// ----------------------------------------------------------------------------

// count the # of items in the array
array2.count

// returns a Bool (true = empty)
array2.isEmpty

// shows if the array contains a certain value (true = yes)
array3.contains("Bandanas")

// assigning value to first|last items
let firstFruit = array3.first
let lastFruit = array3.last


// built-in closures
// ----------------------------------------------------------------------------

// see functions | closures for examples


// Advanced Array Manipulation
// counting frequencies in an array
// ----------------------------------------------------------------------------
let items = ["a", "b", "a", "c"]
let mappedItems = items.map { ($0, 1) }
let counts = Dictionary(mappedItems, uniquingKeysWith: +)


// find differences between two arrays with an extension
// ----------------------------------------------------------------------------
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
// declaration
// ----------------------------------------------------------------------------

// declare only
var dict1: [String: Int]

// declare and initialize
var dict2: [String: Int] = [:]
var dict3 = [String: Int]()

// declare, init, populate
var dict4 = ["AZ":2, "AL":1]


// add & change items
// ----------------------------------------------------------------------------

// direct add or value change
dict3["NY"] = 5												// added
dict4["AL"] = 3												// value changed

// will insert or change (and return the old value)
dict4.updateValue(7, forKey: "MT")


// remove items
// ----------------------------------------------------------------------------
dict4.removeValue(forKey: "AZ")       // removes & returns value
dict4["AL"] = nil											// will remove the pair
dict4 = [:]														// entire dictionary cleared


// miscellaneous
// ----------------------------------------------------------------------------

// referencing
let state = dict4["AL"]								// no dot notation (unordered)

// count the # of items in the dictionary
dict4.count

// returns a Bool (true = empty)
dict4.isEmpty


// iterating over items
// ----------------------------------------------------------------------------

// prints keys and values
for (key, value) in dict3 {
   print("key:\(key), value:\(value)")
}

// print the keys
for key in dict3.keys {
   print("key:\(key)")
}

// print the values
for value in dict3.values {
   print("values:\(value)")
}


// SETS
// declaration
// ----------------------------------------------------------------------------

// declare and initialize
var set1 = Set<String>()

// declare, init, populate
var set2: Set = ["Apples","Oranges", "Straw"]


// add / remove items
// ----------------------------------------------------------------------------
set1.insert("Apples")                         // add items
set2.remove("Oranges")                        // remove items
//set2 = []																			// remove all items


// iterating
// ----------------------------------------------------------------------------
for fruit in set2 {
	print("\(fruit)")
}

set1
set2


// count set objects
// ----------------------------------------------------------------------------
set2.count                                    // o: 2

// count changes in a set - NSCountedSet()
// ----------------------------------------------------------------------------
var set7 = NSCountedSet()
set7 = ["Apples","Oranges", "Straw"]
set7.add("Apples")

set7.count                                    // o: 3
set7.count(for: "Apples")                     // o: 2



// fundamental set operations
// ----------------------------------------------------------------------------

// referencing (contains)
let hasItem = set2.contains("Apples")             // o: true

// combining sets (dups are removed)
var set3 = set1.union(set2)												// o: apples, straw

// returning duplicates (intersect)
let set4 = set1.intersection(set2)								// o: apples

// subtract out values
let set5 = set2.subtracting(set1)									// o: straw

// show only differences
let set6 = set1.symmetricDifference(set2)					// o: straw


// membership and equality operations
// ----------------------------------------------------------------------------

// are all items unique btwn 2 sets? (t/f)
let isUnique = set1.isDisjoint(with: set2)				// o: false

// are all values of the 1st set contained in the 2nd (t/f)
let isContained = set1.isSubset(of: set2)					// o: true

// does the 1st set contain all values of the 2nd (t/f)
let isSuper = set1.isSuperset(of: set2)						// o: false



// testing pass by value for dicts and arrays
// ----------------------------------------------------------------------------
var dictA = [1: 1, 2: 4, 3: 9, 4: 16]
var dictB = dictA

dictB[4] = nil

dictA
dictB


var arrayA = [1, 2, 3, 4, 5]
var arrayB = arrayA

arrayB[0] = 10

arrayA
arrayB