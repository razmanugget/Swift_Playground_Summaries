import Cocoa


// MARK: - SETS

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


// MARK: counting
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


// MARK: fundamental set operations
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


// MARK: membership and equality operations
// are all items unique btwn 2 sets? (t/f) -> false
let isUnique = set1.isDisjoint(with: set2)

// are all 1st set values contained in the 2nd? (t/f) -> true
let isContained = set1.isSubset(of: set2)

// are all 2nd set values contained in the 1st? (t/f) -> false
let isSuper = set1.isSuperset(of: set2)
