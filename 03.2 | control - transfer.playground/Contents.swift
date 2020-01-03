import Cocoa


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


// MARK: - labeled statments
// -> x = 1-5, y = 1
outerLoop: for x in 1...5 {
   innerLoop: for y in 1...3 {
      if y == 2 {
         continue outerLoop
      }
      print("x = \(x), y = \(y)")
   }
}
