import UIKit
// algorithm practice

// does a number exist in an array
func findNumber(arr: [Int], k: Int) -> String {
    for i in arr {
        if i == k {
            return "YES"
        }
    }
    return "NO"
}
let newArray: [Int] = [1 ,2 ,3 ,4 ,5]
let stdout = findNumber(arr: newArray, k: 4)



// print oddnumbers between a range
var l: Int = 1
var r: Int = 5
var oddArray = [Int]()
if l > r {
    let temp = l
    l = r
    r = temp
}

func oddNumbers(l: Int, r: Int) -> [Int] {
    for i in l...r {
        let testForOdd = i % 2
        if testForOdd != 0 {
            oddArray.append(i)
        }
    }
    return oddArray
}
var res = oddNumbers(l: l, r: r)


//var a: [String] = ["hello", "hi"]
//var b: [String] = ["world", "bye"]
//var n: Int = a.count
//var arrayItemCount: [String]
//
//for arrayItemMap in a[0] {
//    for x =
//}
//
//func commonSubstring(a: [String], b: [String]) -> Void {
//
//}

// wtf?
//var a = "hello"
//var b = "world"
//
//
//
//var aString = "hello"
//var bString = "hi"
//
//aString.map { String($0) }
//bString.map { String($0) }
//
//for x in aString {
//    if ((aString.elementsEqual(bString)) == true)
//}

//func commonSubstring(a: [String], b: [String]) -> Void {
//
//}


// count duplicates in an array
var numbers = [1,3,1,4,5,6,3,2,6,2]
var countDupes = 0

func countDuplicates(numbers: [Int]) -> Int {
    let mappedItems = numbers.map { ($0, 1) }
    let countDictionary = Dictionary(mappedItems, uniquingKeysWith: +)

    for (_, value) in countDictionary {
        let temp = Double(value)
        if temp >= 2 {
            countDupes += 1
        }
    }
return(countDupes)
}

var newCount = countDuplicates(numbers: numbers)

// Day 0 - HackerRank
let inputString = readLine()! // get a line of input from stdin and save it to our variable

// Your first line of output goes here
print("Hello, World.")

// Write the second line of output
print(inputString)

// Day 1 - HackerRank


