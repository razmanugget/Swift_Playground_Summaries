import Cocoa

// setup
let x = false
let y = false
let z = false


// MARK: - Control Transfer Statements

// MARK: - continue
// -> 1, 2, 3, 8, 9, 10
for i in 1...10 {
   if (i >= 4 && i <= 7) {
      continue
   }
   print(i)
}

// example: remove vowels
// -> grtmndsthnklk
let puzzleInput = "great minds think alike"
var puzzleOutput = ""

for char in puzzleInput {
   switch char {
   case "a", "e", "i", "o", "u", " ":
      continue
   default:
      puzzleOutput.append(char)
   }
}
print(puzzleOutput)


// MARK: - break
// -> 1, 2, 3
for i in 1...10 {
   if (i >= 4) && (i <= 7) {
      break
   }
   print(i)
}

switch puzzleOutput {
default:
   break
}


// MARK: - fallthrough
// -> number above
var numb = 6

switch numb {
case 0...6:
   print("number")
   fallthrough
default:
   print("number above")
}


// MARK: - return

// error handling
func divide(_ a: Int, by b: Int) -> Int {
   if b == 0 {
      print("does not compute")
      return 0
   }
   return a/b
}

// cleaner code
func messyMethod() {
   if x {
      if y {
         if z {
            // statement XYZ
         } else {
            // statement Y
         }
      } else {
         // statement X
      }
   } else {
      // statement not XYZ
   }
}

func cleanMethod() {
   if !x {
      // statement not X
      return
   }
   
   if !y {
      // statement not Y
      return
   }
   
   if !z {
      // statement not Z
      return
   }
   // statement XYZ
}


// MARK: - labeled statments
// -> i = 1-5, j = 1
outerLoop: for i in 1...5 {
   innerLoop: for j in 1...3 {
      if j == 2 {
         continue outerLoop
      }
      print("i = \(i), j = \(j)")
   }
}
