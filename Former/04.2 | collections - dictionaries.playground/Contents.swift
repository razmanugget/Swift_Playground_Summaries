import Cocoa


// MARK: - DICTIONARIES

// MARK: declaration - create but don't initialize
var dict1: [String: Int]

// declaration - create/init with 0 value
var dict2: [String: Int] = [:]
var dict3 = [String: Int]()

// create and initialize with initial values
var dict4 = ["AZ":2, "AL":1]


// MARK: add & change items
// direct add -> NY, 2
dict3["NY"] = 5

// value changed -> AL, 3
dict4["AL"] = 3

// will insert or change (and return the old value)
dict4.updateValue(7, forKey: "MT")


// MARK: remove items
// -> returns 2
dict4.removeValue(forKey: "AZ")

// will remove the pair -> no return
dict4["AL"] = nil

// entire dictionary cleared
dict3 = [:]


// MARK: iterating over items
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


// MARK: miscellaneous
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
