import UIKit
// HankerRank algorithm practice


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


// HackerRank - Tutorial to read input data
//scan: Scanner = new Scanner(System.in) // open scanner
//var s = scan.next() // read the next token and save it to 's'
//scan.close() // close scanner
//prinn(s) // print 's'


// Day 0 - HackerRank - needs input, so run in hackerrank only
//let inputString = readLine()! // get a line of input from stdin and save it to our variable
//
//// Your first line of output goes here
//print("Hello, World.")
//
//// Write the second line of output
//print(inputString)


// Day 1 - HackerRank - needs input, so run in hackerrank only
//var i = 4
//var d = 4.0
//var s = "HackerRank "
//
//var secondInt: Int
//var secondDouble: Double
//var secondString: String
//
//secondInt = Int(readLine()!)!
//secondDouble = Double(readLine()!)!
//secondString = readLine()!
//
//print(i + secondInt)
//print(d + secondDouble)
//print(s + secondString)


// Day 2 - HackerRank - needs input, so run in hackerrank only
func solve(meal_cost: Double, tip_percent: Int, tax_percent: Int) -> Void {
    var totalMealCost: Double
    let minimumToPay: Double

    let tip = tipCalc(meal_cost: meal_cost, tip_percent: tip_percent)
    let tax = taxCalc(meal_cost: meal_cost, tax_percent: tax_percent)
    totalMealCost = meal_cost + tip + tax
    minimumToPay = (meal_cost + Double(tax))

    // don't be cheap and make the waiter pay for tax and rounding!
    if minimumToPay > Double(Int(totalMealCost)) {
        totalMealCost += 0.0
    }
    print(Int(round(totalMealCost)))
}

func tipCalc(meal_cost: Double, tip_percent: Int) -> Double {
    return(meal_cost * (Double(tip_percent)/100))
}

func taxCalc(meal_cost: Double, tax_percent: Int) -> Double {
    return(meal_cost * (Double(tax_percent)/100))
}

// remove this for submission
var meal_cost = 3.20
var tip_percent = 20
var tax_percent = 8

solve(meal_cost: meal_cost, tip_percent: tip_percent, tax_percent: tax_percent)

// Day 3 - HackerRank - conditional stmts
// this line from HackerRank
//guard let N = Int((readLine()?.trimmingCharacters(in: .    else { fatalError("Bad input") }
//whitespacesAndNewlines))!)
let N = 6

if N % 2 == 0 {
    switch N {
    case 2...5:
        print("Not Weird")
    case 6...20:
        print("Weird")
    default:
        print("Not Weird")
    }
} else {
    print("Weird")
}


// Day 4 - HackerRank - class vs instance
class Person {
    var age: Int = 0

    init(initialAge: Int) {
        if initialAge <= 0 {
            age = 0
            print("Age is not valid, setting age to 0.")
        } else {
            age = initialAge
        }
    }

    func amIOld() {
        if age < 13 {
            print("You are young.")
        } else if age >= 13 && age < 18 {
            print("You are a teenager.")
        } else {
            print("You are old.")
        }
    }

    func yearPasses() {
        age += 1
    }
}

let age = -1
let p = Person(initialAge: age)

p.amIOld()

for _ in 1...3 {
    p.yearPasses()
}

p.amIOld()
