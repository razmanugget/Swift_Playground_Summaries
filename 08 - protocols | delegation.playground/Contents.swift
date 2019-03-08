import UIKit
import MapKit

// Protocols
// ----------------------------------------------------------------------------
protocol PrinterProtocol {
   var i:Int {get set}

   func printThis()
}

class aClass:PrinterProtocol {
   var i = 0
   
   func printThis() {
      print("Implement printThis for aClass \(self.i)")
   }}

var obj = aClass()
obj.printThis()


// using a protocol as a type
// ------------------------------------------------------------------------
protocol Rentable {
   var title:String {get}
   var barcode:String {get set}
   func rent(forWeeks weeks:Int) -> Bool
}

struct Book: Rentable {
   let title:String
   var barcode:String
   let chapterCount:Int
   func rent(forWeeks weeks:Int) -> Bool {
      print("Please return \(title) in \(weeks) weeks.")
      return true
   }}

struct DVD: Rentable {
   let title:String
   var barcode:String
   let lengthInMinutes:Int
   
   func rent(forWeeks weeks:Int) -> Bool {
      print("Please return \(title) in \(weeks) weeks.")
      return true
   }}

struct AudioCD: Rentable {
   let title:String
   var barcode:String
   let audioTracks:Int
   
   func rent(forWeeks weeks:Int) -> Bool {
      print("Please return \(title) in \(weeks) weeks.")
      return true
   }}

let brownBear = Book(title: "Brown Bear", barcode: "132", chapterCount: 1)
let clue = DVD(title: "Clue Movie", barcode: "64543", lengthInMinutes: 94)
let incubus = AudioCD(title: "If not now", barcode: "0987", audioTracks: 11)

let items: [Rentable] = [brownBear, clue, incubus]

for item in items {
   print("Item: \(item.title) is rentable.  Barcode is \(item.barcode)")
}



// protocol as a type with inheritance 
// ----------------------------------------------------------------------------
protocol Rentable2 {
   var title:String {get}
   var barcode:String {get set}
   func rent(forWeeks weeks:Int) -> Bool
}

class Media2: Rentable2 {
   let title:String
   var barcode:String
   
   init(title:String, barcode:String) {
      self.title = title
      self.barcode = barcode
   }
   
   func rent(forWeeks weeks:Int) -> Bool {
      print("Please return \(title) in \(weeks) weeks.")
      return true
   }}

class Book2: Media2 {
   let chapterCount:Int
   
   init(title:String, barcode:String, chapterCount:Int) {
      self.chapterCount = chapterCount
      super.init(title: title, barcode: barcode)
   }}

class DVD2: Media2 {
   let lengthInMinutes:Int
   
   init(title:String, barcode:String, lengthInMinutes:Int) {
      self.lengthInMinutes = lengthInMinutes
      super.init(title: title, barcode: barcode)
   }}

class AudioCD2: Media2 {
   let audioTracks:Int
   
   init(title:String, barcode:String, audioTracks:Int) {
      self.audioTracks = audioTracks
      super.init(title: title, barcode: barcode)
   }}

let brownBear2 = Book2(title: "Brown Bear", barcode: "132", chapterCount: 1)
let clue2 = DVD2(title: "Clue Movie", barcode: "64543", lengthInMinutes: 94)
let incubus2 = AudioCD2(title: "If not now", barcode: "0987", audioTracks: 11)

let items2: [Rentable2] = [brownBear2, clue2, incubus2]

for item in items2 {
   print("Item: \(item.title) is rentable.  Barcode is \(item.barcode)")
}


// protocol composition 
// ----------------------------------------------------------------------------
//func SomeMethod(composedProperty: protocol<ProtocolOne,
//   ProtocolTwo>) {}




// protocol optionals
// ----------------------------------------------------------------------------
/* fix for swift 3.0
@objc protocol BJMAnnotation: NSObjectProtocol {
   var coordinate: CLLocationCoordinate2D {get}
   optional var title: String! {get}
   optional func setCoordinate(newCoord:CLLocationCoordinate2D)
}*/



// Delegation 
// ----------------------------------------------------------------------------
protocol TaskDelegate {
   func taskStatusHasChanged(task:Task, done:Bool)
}

class Project:TaskDelegate {
   var name = ""
   var listOfTasks = [Task]()
   func taskStatusHasChanged(task: Task, done: Bool) {
      let status = (task.done ? "Done" : "In Progress")
      print("Task \(task.name) is now \(status)")
   }}

class Task {
   var name = ""
   private var _done = false
   var delegate:TaskDelegate?    // **the Delegate**
   var done:Bool {
      get {
         return _done
      }
      set {
         _done = newValue
        self.delegate?.taskStatusHasChanged(task: self, done: _done)
      }}}

var p = Project()
p.name = "Cook Dinner"

let taskNames = ["Choose Menu", "Buy Groceries", "Cook Food"]

for name in taskNames {
   var t = Task()
   t.name = name
   t.delegate = p    // assign delegate property to each task
   p.listOfTasks.append(t)
}

p.listOfTasks[0].done = true


// delegation other example 
// ----------------------------------------------------------------------------

protocol ButtonDelegateProtocol {
   func didTapButton(button: Button)
}

class ButtonDelegate: ButtonDelegateProtocol {
   func didTapButton(button: Button) {
   print("You tapped the button labeled \(button.title).")
   }}

class Button {
   let title: String
   let delegate: ButtonDelegateProtocol
   
   init(title: String, delegate: ButtonDelegateProtocol) {
      self.title = title
      self.delegate = delegate
   }
   
   func buttonTapped() {
    self.delegate.didTapButton(button: self)
   }}

let button = Button(title: "Tap Me!", delegate: ButtonDelegate())
button.buttonTapped()      //


// delegation - Legend of Zelda
// ----------------------------------------------------------------------------
protocol Healable {
   var healableName: String {get}
   var heartsRestores: Double {get}
}

struct BluePotion: Healable {
   var healableName: String {return "blue potion"}
   var heartsRestores: Double {return 4.0}
}

struct Heart: Healable {
   var healableName: String {return "heart piece"}
   var heartsRestores: Double {return 1.0}
}

struct Enemy {
   let name: String
   let damage: Double
}

protocol GameManagerDelegate {
   func gameDidStart(game: TheLegendOfZelda)
   func gameDidEnd(game: TheLegendOfZelda)
}

class TheLegendOfZelda {
   let maxHeartContainers = 20
   let minHearts = 0.0
   let delegate: GameManagerDelegate
   let name = "Link"
   var sword: String?
   var heartContainers = 3.0
   var hearts: Double = 0.0 {
      didSet {
         if hearts > heartContainers {
            hearts = heartContainers
         }
         if hearts <= minHearts {
            hearts = minHearts
         }}}
   
   init(delegate: GameManagerDelegate) {
      self.delegate = delegate
    self.delegate.gameDidStart(game: self)
   }
   
   func takeDamage(fromEnemy enemy: Enemy) {
      hearts -= enemy.damage
      print("\(name) lost \(enemy.damage) hearts from \(enemy.name), \(hearts) hearts left.")
      if hearts == 0 {
        self.delegate.gameDidEnd(game: self)
      }}
   
   func heal(item: Healable) {
      hearts += item.heartsRestores
      print("\(name) gained \(item.heartsRestores) hearts from a \(item.healableName), and has \(hearts) hearts left.")
   }
}

class GameManager: GameManagerDelegate {
   func gameDidStart(game: TheLegendOfZelda) {
      print("It's dangerous to go alone.  Take this.")
      game.sword = "Wooden"
      game.hearts = 3.0
   }
   
   func gameDidEnd(game: TheLegendOfZelda) {
      print("Game Over.  Return of Ganon")
   }
}

let link = TheLegendOfZelda(delegate: GameManager())
let keese = Enemy(name:"Keese", damage: 0.5)
let dekuBaba = Enemy(name:"Deku Baba", damage: 1.0)
let ganon = Enemy(name:"Ganon", damage: 2.0)

link.takeDamage(fromEnemy: keese)
link.heal(item: BluePotion())
link.takeDamage(fromEnemy: keese)
link.takeDamage(fromEnemy: dekuBaba)
link.heal(item: Heart())
link.takeDamage(fromEnemy: ganon)
link.takeDamage(fromEnemy: ganon)









