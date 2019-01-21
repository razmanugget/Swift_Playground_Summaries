import UIKit

// Listing 2-1 Variables with unclear context
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
