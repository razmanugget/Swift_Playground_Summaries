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
// Listing 2-2 Variables have a context (good)
class GuessStatisticsMessage {
    var word: String
    var letter: Character

    lazy var letterCount: Int = word.countInstances(of: letter)
    lazy var number: String = createPluralDependentMessageParts(letterCount: Int)

    var verb: String
    var pluralModifier: String

    init(word: String,
         letter: Character
        ) {
        self.word = word
        self.letter = letter
    }

    func make(candidate: Character, letter: Int) -> String {
        createPluralDependentMessageParts(letterCount: Int)
        return ("There \(verb) \(number) letter\(pluralModifier).")
    }

    func createPluralDependentMessageParts(letterCount: Int) -> () {
        if (letterCount == 0) {
            thereAreNoLetters()
        } else if (letterCount == 1) {
            thereIsOneLetter()
        } else {
            thereAreManyLetters(letters: letterCount)
        }
    }

    func thereAreManyLetters(letters: Int) -> () {
        number = String(letterCount)
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

var wordCount = GuessStatisticsMessage(word: "hello", letter: "l")
print(wordCount)

