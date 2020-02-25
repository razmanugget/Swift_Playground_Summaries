import UIKit


// SAMPLE CODE FOR 4MYLAST
// lazy properties
// ----------------------------------------------------------------------------
//class LifeCounter {
//  var totalTime: Int = 0 {
//    willSet(lifeChange) {
//      print("About to set Your Time to \(lifeChange)")
//    }
//    didSet {
//      if totalTime > oldValue  {
//        print("Added \(totalTime - oldValue) minutes")
//      }}}}
//
//let lifeCounter = LifeCounter()
//lifeCounter.totalTime = 200
//lifeCounter.totalTime = 360

// copy and run in Xcode playground for best formatting
var techSkills = ["Swift_4.2":7, "iOS_12":5, "OOP": 6, "Git_GitHub_Desktop":7, "UI_UX_Design":8, "Photoshop":9, "Sketch":9, "Mac_WindowsOS":9, "Word_Excel_Powerpoint":7, "HTML_CSS":5, "WordPress":4, "JavaScript":2]

var businessSkills = ["Project_Management": 7, "Agile_Scrum": 3, "Public_Speaking": 7, "Copywriting": 9, "Accounting": 7, "Cost_Benefit_Analysis": 7, "Empathy": 10]

var languageSkills = ["English(native_spkr)": 10, "French": 5, "Japanese": 3, "Polish": 1]

protocol basicData {
  var title: String {get}
  var location: String {get}
  var yearStart: Int {get}
  var yearEnd: Int {get set}
}

class Experience: basicData {
  var title:String
  var location: String
  let yearStart: Int
  var yearEnd: Int
  
  init(title:String, location:String, yearStart: Int, yearEnd: Int) {
    self.title = title
    self.location = location
    self.yearStart = yearStart
    self.yearEnd = yearEnd
  }
  
  func responsibilities(create: String...) -> String {
    return "This was created: \(create)"
  }
}

var lyfeBug = Experience(title: "Project Lead", location: "Warsaw, Poland", yearStart: 2016, yearEnd: 2018)
lyfeBug.responsibilities(create: "website & content for: www.lyfebug.com", "prototype mockups for mobile apps", "swift learning materials for student use")
let noteStir = Experience(title: "Founder/Project Manager", location: "Dover, DE", yearStart: 2009, yearEnd: 2015)
let cheminDeSavoir = Experience(title: "Founder and CEO", location: "Las Vegas, NV", yearStart: 1998, yearEnd: 2009)
let dell = Experience(title: "Finance Intranet Site Manager", location: "Austin, TX", yearStart: 1995, yearEnd: 1998)


/*
 EXPERIENCE
 LyfeBug  Lviv, Ukraine
 Project Leader  2016 – present
 Created prototype mockups for mobile apps
 Assembled and identified Swift learning materials for student use
 Created the website and content for lyfebug.com
 
 NoteStir, Inc.  Dover, DE
 Project Manager  2009 – 2015
 Responsible for front-end UI design for a note sharing wiki web app
 Balanced site needs with Drupal developer team abilities
 Designed a simple UX for class note searches
 
 Chemin de Savoir, Inc.   Las Vegas, NV
 Founder and CEO   1998 – 2009
 Priced and traded equities and derivatives in excess of $20 million
 Fundamental and trend analysis in the tech sector
 Filed corporate financial statements and kept all records
 
 Dell, Inc.   Austin, TX
 Finance Intranet Site Manager   1995 – 1998
 Managed a team of 4 in support of a user community of 1200+
 Implemented finance best practices and consistency initiatives
 Conducted usability studies to optimize site content
 Financial Systems Analyst
 Consolidated and reconciled Asia Pacific financial data
 Administered financial databases in Hyperion | Ross
 Project lead in the migration of Finance to Windows 95
 
 EDUCATION
 University of Texas at Austin   1995
 Bachelors of Business Administration – Major Accounting
 Minor Japanese Language | Studies
 Cumulative GPA 3.33/4.0  |  GMAT 740
 
 Language Studies Abroad
 French – IS Aix-en-Provence Institute         France 1998
 Japanese – Southern Illinois University  Nakajo, Japan 1993
 */

    // subscripts - simplified example with no error handling
// ----------------------------------------------------------------------------
struct Matrix {
    var rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            return grid[(row * columns) + column]
        }
        set {
            grid[(row * columns) + column] = newValue
        }}}
var matrix = Matrix(rows: 2, columns: 2)

matrix[0, 1] = 1.4


