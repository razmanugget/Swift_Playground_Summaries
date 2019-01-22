import UIKit

// Listing 2-1 Variables with unclear context (bad)
func printGuessStatistics(word: String) -> () {

    var number: String
    var verb: String
    var pluralModifier: String

    if (word.count == 0) {
        number = "no"
        verb = "are"
        pluralModifier = "s"
    } else if (word.count == 1) {
        number = "1"
        verb = "is"
        pluralModifier = ""
    } else {
        number = "several"
        verb = "are"
        pluralModifier = "s"
    }

    let guessMessage = "There \(verb) \(number) letter\(pluralModifier) in \(word)."
    print(guessMessage)
}
printGuessStatistics(word: "hello")


// Listing 2-2 Variables have a context (good) -> changed program to spell out numbers
//class GuessStatisticsMessage {
//    var number: String
//    var verb: String
//    var pluralModifier: String
//
//    init(number: String,
//         verb: String,
//         pluralModifier: String) {
//        self.number = number
//        self.verb = verb
//        self.pluralModifier = pluralModifier
//    }
//
//    func make(candidate: Character, letters: Int) -> String {
//        createPluralDependentMessageParts(letters: letters)
//        return ("There \(verb) \(number) letter\(pluralModifier).")
//    }
//
//    func createPluralDependentMessageParts(letters: Int) -> () {
//        if (letters == 0) {
//            thereAreNoLetters()
//        } else if (letters == 1) {
//            thereIsOneLetter()
//        } else {
//            thereAreManyLetters(letters: letters)
//        }
//    }
//
//    func thereAreManyLetters(letters: Int) -> () {
//        number = (letters).count
//        verb = "are"
//        pluralModifier = "s"
//    }
//
//    func thereIsOneLetter() -> () {
//        number = "1"
//        verb = "is"
//        pluralModifier = ""
//    }
//
//    func thereAreNoLetters() -> () {
//        number = "no"
//        verb = "are"
//        pluralModifier = "s"
//    }
//}


