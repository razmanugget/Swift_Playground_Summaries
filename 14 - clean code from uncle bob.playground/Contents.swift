import UIKit

// added to create ability to easily count characters
extension String {
    func countInstances(of charToFind: Character) -> Int {
        return reduce(0) {
            $1 == charToFind ? $0 + 1 : $0
        }
    }
}

// fixed and working
// Listing 2-1 Variables with unclear context (bad)
func printGuessStatistics(word: String, letter: Character) -> () {

    var number: String
    var verb: String
    var pluralModifier: String
    var letterCount: Int

    // added by me to count
    letterCount = word.countInstances(of: letter)

    if (word.count == 0) {
        number = "no"
        verb = "are"
        pluralModifier = "s"
    } else if (word.count == 1) {
        number = "1"
        verb = "is"
        pluralModifier = ""
    } else {
        number = String(letterCount)
        verb = "are"
        pluralModifier = "s"
    }

    let guessMessage = "There \(verb) \(number) \"\(letter)\" letter\(pluralModifier) in \(word)"
    print(guessMessage)
}
printGuessStatistics(word: "bazooka forest ranger", letter: "r")


// not fixed nor working
// Listing 2-2 Variables have a context (good) -> changed program to spell out numbers
class GuessStatisticsMessage {
    var word: String
    var letter: Character

    lazy var number: String
    lazy var verb: String
    lazy var pluralModifier: String

    init(number: String,
         verb: String,
         pluralModifier: String) {
        self.number = number
        self.verb = verb
        self.pluralModifier = pluralModifier
    }

    func make(candidate: Character, letters: Int) -> String {
        createPluralDependentMessageParts(letters: letters)
        return ("There \(verb) \(number) letter\(pluralModifier).")
    }

    func createPluralDependentMessageParts(letters: Int) -> () {
        if (letters == 0) {
            thereAreNoLetters()
        } else if (letters == 1) {
            thereIsOneLetter()
        } else {
            thereAreManyLetters(letters: letters)
        }
    }

word.countInstances(of: candidate)

    func thereAreManyLetters(letters: Int) -> () {
        number = (letters).count
        verb = "are"
        pluralModifier = "s"
    }

    func thereIsOneLetter() -> () {
        number = "1"
        verb = "is"
        pluralModifier = ""
    }

    func thereAreNoLetters() -> () {
        number = "no"
        verb = "are"
        pluralModifier = "s"
    }
}

var wordCount = GuessStatisticsMessage(number: <#T##String#>, verb: <#T##String#>, pluralModifier: <#T##String#>)

