import UIKit

// Listing 2-1 Variables with unclear context (bad)
func printGuessStatistics(candidate: Character, count: Int) -> () {

    var number: String
    var verb: String
    var pluralModifier: String

    if (count == 0) {
        number = "no"
        verb = "are"
        pluralModifier = "s"
    } else if (count == 1) {
        number = "1"
        verb = "is"
        pluralModifier = ""
    } else {
        number = "several"
        verb = "are"
        pluralModifier = "s"
    }

    let guessMessage = "There \(verb) \(number) \(pluralModifier)letter \(candidate)."
    print(guessMessage)
}

printGuessStatistics(candidate: "h", count: 1)

// Listing 2-2 Variables have a context (good) -> changed program to spell out numbers
class GuessStatisticsMessage {
    var number: String
    var verb: String
    var pluralModifier: String

    init(number: String,
         verb: String,
         pluralModifier: String) {
        self.number = number
        self.verb = verb
        self.pluralModifier = pluralModifier
    }

    func make(candidate: Character, letters: Int) -> String {
        createPluralDependentMessageParts(letters: letters)
        return ("There \(verb) \(number) \(pluralModifier)letter \(candidate).")
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


