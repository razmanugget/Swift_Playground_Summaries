import UIKit

// Preview to view, then copy and run in an Xcode playground for better formatting
var readyToHire: Bool?
var techSkills = [
    "Swift 4.2": 7,
    "iOS 12": 5,
    "OOP": 6,
    "Git, GitHub Desktop": 7,
    "UI UX Design": 7,
    "Photoshop": 7,
    "Sketch": 8,
    "Mac Windows OS": 9,
    "Word Excel Powerpoint": 7,
    "HTML CSS": 5,
    "WordPress": 4,
    "JavaScript": 2
]
var businessSkills = [
    "Project Management": 7,
    "Agile Scrum": 3,
    "Public Speaking": 7,
    "Copywriting": 9,
    "Accounting": 7,
    "Cost Benefit Analysis": 7,
    "Empathy": 10
]
var languageSkills = [
    "English (native speaker)": 10,
    "French": 5,
    "Japanese": 3,
    "Polish": 1
]

class Experience {
    
    // MARK: Properties
    
    var company: String
    var title: String
    var location: String
    let yearStart: Int
    var yearEnd: Int
    var responsibleFor: [String]
    
    // MARK: Initialization
    
    init(company: String,
         title: String,
         location: String,
         yearStart: Int,
         yearEnd: Int,
         responsibleFor: [String]
        ) {
        self.company = company
        self.title = title
        self.yearStart = yearStart
        self.yearEnd = yearEnd
        self.location = location
        self.responsibleFor = responsibleFor
    }
    
    // MARK: Functions
    
    func printList() {
        print("\nCompany: \(company)\nTitle: \(title)")
        print("From: \(yearStart) to \(yearEnd)")
        print("Location: \(location)")
        for item in 0..<responsibleFor.count {
            print("Did this: \(responsibleFor[item])")
        }
    }
}

var experience:[Experience] = [
    Experience (
        company: "LyfeBug",
        title: "Project Lead",
        location: "Warsaw, Poland",
        yearStart: 2016,
        yearEnd: 2019,
        responsibleFor: [
            "Swift learning materials for student use",
            "Website & content for: www.lyfebug.com",
            "Prototype mockups for mobile apps"
        ]),
    Experience(
        company: "NoteStir, Inc.",
        title: "Founder/Project Manager",
        location: "Dover, Delaware",
        yearStart: 2009,
        yearEnd: 2015,
        responsibleFor: [
            "Front-end UI design for a note sharing wiki web app",
            "Balancing site needs with Drupal developer team abilities",
            "Paperwork - financials, Service Mark"
        ]),
    Experience(
        company: "Chemin de Savoir, Inc.",
        title: "Founder and CEO",
        location: "Las Vegas, Nevada",
        yearStart: 1998,
        yearEnd: 2009,
        responsibleFor: [
            "Pricing and trading equities and derivatives",
            "Tech sector trend analysis",
            "Corporate financial statment filings"
        ]),
    Experience(
        company: "Dell",
        title: "Finance Intranet Site Manager",
        location: "Austin, Texas",
        yearStart: 1995,
        yearEnd: 1998,
        responsibleFor: [
            "Managing a team of 4 in support of a user community of 1200+",
            "Administered financial databases in Hyperion & Ross",
            "Leading the migration of Finance to Windows 95 (man, I am sooo old)"
        ])
]

for item in 0..<experience.count {
    print(experience[item].printList())
}
for (key, value) in techSkills {
    print("tech skill: \(key), ability: \(value)")
}
for (key, value) in languageSkills {
    print("language: \(key), ability: \(value)")
}
for (key, value) in businessSkills {
    print("business skill: \(key), ability: \(value)")
}

var hiringDecision = readyToHire ?? true
if hiringDecision == true {
    print("\nName: Rami Perzak-Shultz\nPhone: +48 532 364 660\nEmail: rami_s@hotmail.com")
} else {
    print("\n\nDoes not compute.")
}



