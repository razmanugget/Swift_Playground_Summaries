import UIKit

// copy and run in Xcode playground for better formatting
var readyToHire: Bool
var techSkills = ["Swift 4.2":7, "iOS 12":5, "OOP": 6, "Git, GitHub Desktop":7, "UI UX Design":7, "Photoshop":7, "Sketch":8, "Mac WindowsOS":9, "Word Excel Powerpoint":7, "HTML CSS":5, "WordPress":4, "JavaScript":2]
var businessSkills = ["Project Management": 7, "Agile Scrum": 3, "Public Speaking": 7, "Copywriting": 9, "Accounting": 7, "Cost Benefit Analysis": 7, "Empathy": 10]
var languageSkills = ["English (native speaker)": 10, "French": 5, "Japanese": 3, "Polish": 1]

struct Experience {
  var title:String, location: String
  let yearStart: Int; var yearEnd: Int
  var responsibleFor: [String]
  
  init(title: String, location: String, yearStart: Int, yearEnd: Int, responsibleFor: [String]) {
    self.title = title
    self.location = location
    self.yearStart = yearStart
    self.yearEnd = yearEnd
    self.responsibleFor = responsibleFor
  }
  
  func printList() {
    print("hello \(title)")
  }
}

var lyfeBug = Experience(title: "Project Lead", location: "Warsaw, Poland", yearStart: 2016, yearEnd: 2018, responsibleFor: ["Swift learning materials for student use", "Website & content for: www.lyfebug.com", "Prototype mockups for mobile apps"])
let noteStir = Experience(title: "Founder/Project Manager", location: "Dover, DE", yearStart: 2009, yearEnd: 2015, responsibleFor: ["Front-end UI design for a note sharing wiki web app", "Balancing site needs with Drupal developer team abilities", "Paperwork - financials, Service Mark"])
let cheminDeSavoir = Experience(title: "Founder and CEO", location: "Las Vegas, NV", yearStart: 1998, yearEnd: 2009, responsibleFor: ["Pricing and trading equities and derivatives", "Tech sector trend analysis", "Corporate financial statment filings"])
let dell = Experience(title: "Finance Intranet Site Manager", location: "Austin, TX", yearStart: 1995, yearEnd: 1998, responsibleFor: ["Managing a team of 4 in support of a user community of 1200+", "Administered financial databases in Hyperion & Ross", "Leading the migration of Finance to Windows 95 (man, I am sooo old)"])

for (key, value) in techSkills {print("skill: \(key), ability: \(value)")}
for (key, value) in businessSkills {print("skill: \(key), ability: \(value)")}
for (key, value) in languageSkills {print("language: \(key), ability: \(value)")}

lyfeBug.printList()
readyToHire = true

//if readyToHire == true ?? false
readyToHire ? ((print("Yes") : print("No"))


