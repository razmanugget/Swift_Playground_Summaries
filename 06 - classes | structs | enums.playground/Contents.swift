import UIKit


// CLASSES & STRUCTS
// ----------------------------------------------------------------------------

// pass by reference vs value
// declared
class C {
	var varX = 1
}
struct S {
	var varX = 1
}

// instances created, both struct|class = 1
let class1 = C()
// a constant, but underlying var can change
var struct1 = S()

// new instances created from copies
var class2 = class1
var struct2 = struct1

// new assignment of a variable
// affects all instances of the class
class2.varX = 2
// treated independently
struct2.varX = 2

// this is where they differ
print(class1.varX)						// o: 2  (Reference)
print(struct1.varX)						// o: 1  (Value)



// PROPERTIES
// ----------------------------------------------------------------------------

// properties - stored
struct SYard {								// name: UpperCamelCase
	var length: Int
	var height: Int = 10				// still use an argument when instantiating
	let width: Int = 10					// no argument used when instantiating (let)
}

class CYard {									// name: UpperCamelCase
	var length: Int = 10
	let width: Int = 10					// cannot be changed even if instantiated
}															//   as a variable

var newSYard = SYard(length: 20, height: 20)
// need initializers to change values
let newCYard = CYard()


// properties - lazy
class BonusCompute {
lazy var bonus = randomBonus()
  
  func randomBonus() -> Int {
    return Int(arc4random())
  }
}
// shows bonus as 'nil'
var newBonus = BonusCompute()
// now bonus is computed
print(newBonus.bonus)


// properties - computed
struct SideCompute {
	var side: Double
   
	// computed property
	var area: Double {
		get {
			return side * side
		}
		set (newValue) {
			side = sqrt(newValue)
		}}}

// setter wasn't accessed
var newSquare = SideCompute(side: 12)
// -> 144
newSquare.area

// setter is accessed
newSquare.area = 9
// o-> 3
newSquare.side


// properties - computed (no setter)
struct SquareArea {
	var side: Int
	
	var area: Int {return side * side}				// implied getter only
	var area3d: Int {
		return side * side * side								// implied getter only
	}}

var newSquare2 = SquareArea(side: 5)
// -> 25
newSquare2.area


// property observers
class ObserveName {
	var name:String = "John Doe" {
		willSet (newValue) {							// rename newValue if needed
			print("About to change name to \(newValue)")
		}
		didSet {													// defaults to name oldValue
			print("Have changed name from \(oldValue)")
		}}}

var newName = ObserveName()
// console shows observer actions
newName.name = "Jane Doe"


// key-value observing (KVO)
@objc class ObservePerson: NSObject {
  @objc dynamic var name = "Taylor"
}
let taylor = ObservePerson()

taylor.observe(\ObservePerson.name, options: .new) { person, change in
  print("I'm now called \(person.name)")
}
// -> I'm now called Justin
taylor.name = "Justin"         


// type properties (static)
struct SomeStructure {
	static var storedTypeProp = "Some value."
	static var computedTypeProp: Int {return 1}
}

enum SomeEnumeration {
	static var storedTypeProp = "Some value."
	static var computedTypeProp: Int {return 6}
}

class SomeClass {
	static var storedTypeProp = "Some value."
	static var computedTypeProp: Int {return 7}
	class var overrideableComputedTypeProp: Int {return 9}
}
// -> 1
SomeStructure.computedTypeProp
// -> Some value.
SomeClass.storedTypeProp



// METHODS
// ----------------------------------------------------------------------------

// instance methods
class Counter {
	var count = 0
	func increment() {count += 1}
	func increment(by amount: Int) {count += amount}
	func reset() {count = 0}
}
let counter = Counter()

counter.increment()														// o: 1
counter.increment(by: 5)											// o: 6
counter.reset()																// o: 0


// modifying value types within methods (mutating func)
struct Mutation {
	var number = 7							// can't change w/o mutating
	
	mutating func multiplyBy(value: Int) {
		number *= value
	}
}
var myMutate = Mutation()

// can use func directly
myMutate.multiplyBy(value: 5)
// -> 35
myMutate.number


// non-mutating example of above
struct NoMutation {
	func multiplyBy(value: Int) -> Int {
		var number = 7
		number *= value
		return number
	}}
var myNoMutate = NoMutation()

var newValRec = myNoMutate.multiplyBy(value: 5)
newValRec																	// o: 35


// use self to modify/change a method property
enum OnOffSwitch {
	case off, on
	
	mutating func next() {
		switch self {
		case .off:
			self = .on
		case .on:
			self = .off
		}}}
var lightSwitch = OnOffSwitch.on
// -> .off
lightSwitch.next()


// type methods (static)
struct SomeStructure2 {
	static func someTypeMethod() {print("type")}
}

enum SomeEnumeration2 {
	static func someTypeMethod() {print("type")}
}

class SomeClass2 {
	class func overrideableTypeMethod() {print("type")}
}

SomeStructure2.someTypeMethod()
SomeClass2.overrideableTypeMethod()



// SUBSCRIPTS
// ----------------------------------------------------------------------------

// simple subscript with get/set
class Hand {
	var fingers = ["thumb", "index", "middle", "ring", "pinky"]
	subscript(i: Int) -> String {
		get {return fingers [i]}
		set {fingers[i] = newValue}
	}}
let hand = Hand()

hand[4] = "pinkie"
// -> middle
print(hand[2])

func nada(this: NSString , that: NSString ) -> Int {
  return (1)
}

// turning the subscript into a basic array
// ----------------------------------------------------------------------------
class Hand2 {
	let fingers = ["thumb", "index", "middle", "ring", "pinky"]
}
let hand2 = Hand2()

print(hand2.fingers[1])													// o: index


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

matrix[0, 1] = 1.4											// accessing via the subscript
matrix[1, 0] = 3

print(matrix [0, 1])


// subscripts - official Apple Doc example
// ----------------------------------------------------------------------------
struct Matrix2 {
	let rows: Int, columns: Int
	var grid: [Double]
	init(rows: Int, columns: Int) {
		self.rows = rows
		self.columns = columns
		grid = Array(repeating: 0.0, count: rows * columns)
	}
	func indexIsValid(row: Int, column: Int) -> Bool {
		return row >= 0 && row < rows && column >= 0 && column < columns
	}
	subscript(row: Int, column: Int) -> Double {
		get {
			assert(indexIsValid(row: row, column: column), "Index out of range")
			return grid[(row * columns) + column]
		}
		set {
			assert(indexIsValid(row: row, column: column), "Index out of range")
			grid[(row * columns) + column] = newValue
		}
	}
}
var matrix2 = Matrix2(rows: 2, columns: 2)

matrix2[0, 1] = 1.5
matrix2[1, 0] = 3.2



// INHERITANCE
// base class
// ----------------------------------------------------------------------------
class Vehicle {
	var currentSpeed = 0.0
	var desc: String {
		return "traveling at \(currentSpeed) mph"
	}
	func makeNoise() {												// do nothing
	}
}
let someVehicle = Vehicle()
someVehicle.desc


// subclass (:)
// ----------------------------------------------------------------------------
class Bicycle: Vehicle {							// inherits from Vehicle
	var hasBasket = false
}
let bicycle = Bicycle()

bicycle.hasBasket = true
bicycle.currentSpeed = 15.0


// override properties/methods (override)
// ----------------------------------------------------------------------------
class Tandem: Bicycle {								// inherits from Bicycle, Vehicle
	var gear = 1
	override var desc: String {					// overrides Vehicle desc
		return super.desc + " in gear \(gear)"
	}
	
	override func makeNoise() {					// overrides Vehicle desc
		print("Ding Ding")
	}
}
let tandem = Tandem()

tandem.hasBasket = true
tandem.currentSpeed = 22.0


// prevent overrides (final)
// ----------------------------------------------------------------------------
final class Vehicle2 {								// takes precedence to block
																			// overrides for the entire class
	final var currentSpeed = 0.0
	final var desc: String {								// selective blocking
		return "traveling at \(currentSpeed) mph"
	}
	final func makeNoise() {								// selective blocking
	}
}



// INITIALIZATION
// basic initializers
// ----------------------------------------------------------------------------
class Fruit {
	let banana: Int							// declaration
	init() {										// default init for banana
		banana = 1
	}														// does the same as above, but infers type
	let strawberries = 2				// (preferred) combine declaration/init
}
var fruit = Fruit()


// default initializers - classes
// ----------------------------------------------------------------------------
class Fruit2 {
	let banana = 1											// declared/initialized
	var kiwi: Int?											// auto initialized to "nil"
}
var fruit2 = Fruit2()									// initialized when instantiated


// default initializers - structs
// ----------------------------------------------------------------------------
struct Fruit3 {
	let banana: Int											// auto memberwise init
}
var fruit3 = Fruit3(banana: 2)				// memberwise init = banana


// initializing with parameters
// ----------------------------------------------------------------------------
class Musketeer {
	let name: String
	var hasSword: Bool = false
	
	init() {																// create default - no params
		self.name = "D'Artagnan"
	}
	init(name: String) {										// with parameter
		self.name = name
	}
	init(withName name: String) {						// with named argument
		self.name = name
	}
	init(_ name: String) {									// with no argument label
		self.name = name
		self.hasSword = true									// inherited when initialized
	}
}
var anon = Musketeer()
anon.name																	// o: D'Artagnan
anon.hasSword															// o: false

var athos = Musketeer(name: "Athos")
athos.name																// o: Athos

var porthos = Musketeer(withName: "Porthos")
porthos.name															// o: Porthos

var aramis = Musketeer("Aramis")
aramis.name																// o: John Doe
aramis.hasSword														// o: true


// initializer delegation for value types
// ----------------------------------------------------------------------------
struct Duckling {
	var age = 2
}
struct Duck {
	var ageOf = Duckling()							// passing in Duckling
	
	init() {}
	init(passIn: Duckling) {						// * uses Duckling init (age: ) *
		self.ageOf = passIn
	}
}
var duckie1 = Duck()									// default init
duckie1.ageOf.age											// o: 2  (inherits from Duckling)
duckie1.ageOf													// o: Duckling

var duckie2 = Duck(passIn: Duckling(age: 3))
duckie2.ageOf.age											// o: 3


// designated initializer inheritance
// ----------------------------------------------------------------------------
class Computer {
	var numberOfKeys = 52					// has default init()
}																// if constant, then cannot be changed
class IPhone: Computer {
	override init() {							// cancels all superclass inits for sub
		super.init()								// phase 1 - initial value setup
		numberOfKeys = 1						// phase 2 - customization
	}}
class MacBook: Computer {				// no inits, inherits all superclass
}
var myiPhone = IPhone()
myiPhone.numberOfKeys						// o: 1

var myMacBook = MacBook()
myMacBook.numberOfKeys					// o: 52


// convenience initializer inheritance
// ----------------------------------------------------------------------------
class Disney {
	var name: String
	
	init(name: String) {										// the designated init
		self.name = name
	}
	convenience init() {										// acts as the default init
		self.init(name: "[unnamed]")
	}}
class Dog: Disney {
	var feetWalkedOn: Int
	
	init(name: String, feetWalkedOn: Int) {	// designated init
		self.feetWalkedOn = feetWalkedOn
		super.init(name: name)
	}
	override convenience init(name: String) {
		self.init(name: name, feetWalkedOn: 4)
	}}
class House: Dog {												// since House has no inits,
	var hasHouse = true											// inherits ALL super inits
}

let mouse = Disney(name: "Mickey")				// o: name: Mickey
let rabbit = Disney()											// o: name: unnamed

let dog1 = Dog()													// o: name: unnamed, feet: 4
let dog2 = Dog(name: "Pluto")							// o: name: Pluto, feet: 4
let dog3 = Dog(name: "Goofy", feetWalkedOn: 2)	// o: Goofy, feet: 2

let house1 = House()											// o: name: unnamed, feet: 4
let house2 = House(name: "Pluto")					// o: name: Pluto, feet: 4
let house3 = House(name: "Goofy", feetWalkedOn: 2) //o: Goofy, feet: 2


// failable initializers - struct
// ----------------------------------------------------------------------------
struct Animal {
	let species: String
	init?(species: String) {											// failure is possible
		if species.isEmpty {return nil}							// forces init to fail
		self.species = species
	}}
let someCreature = Animal(species: "Giraffe")		// o: Giraffe
let anonCreature = Animal(species: "")					// o: nil is returned


// failable initializers - enum
// ----------------------------------------------------------------------------
enum TempUnit {
	case celsius, fahrenheit
	init?(symbol: Character) {					// failure is possible
		switch symbol {
		case "C":
			self = .celsius
		case "F":
			self = .fahrenheit
		default:
			return nil											// forces init to fail if invalid
		}}}


// failable initializers - enum raw value
// ----------------------------------------------------------------------------
enum TempRawUnit: Character {
	case celsius = "C", fahrenheit = "F"
}
let unknownUnit = TempRawUnit(rawValue: "X")		// o: nil


// delegating to a failable initializer
// ----------------------------------------------------------------------------
class Product {
	let name: String
	init?(name: String) {
		if name.isEmpty {return nil}
		self.name = name
	}}
class CartItem: Product {
	let quantity: Int
	init?(name: String, quantity: Int) {
		if quantity < 1 {return nil}					// super isn't called if nil
		self.quantity = quantity
		super.init(name: name)
	}}


// overriding a failable initializer
// ----------------------------------------------------------------------------
class Document {
	var name: String?
	
	init() {}
	init?(name: String) {
		if name.isEmpty {return nil}
		self.name = name
	}}
class AutoNameDoc: Document {
	override init() {
		super.init()
		self.name = "untitled"
	}
	override init(name: String) {
		super.init()
		if name.isEmpty {
			self.name = "untitled"
		} else {
			self.name = name
		}}}
class UntitledDoc: Document {										// doesn't inherit all
	override init() {
		super.init(name: "untitled")!								// forced upwrap (!)
	}
}
let document = Document()												// o: nil
let document2 = Document(name: "")							// o: nil
let document3 = Document(name: "taxes")					// o: taxes (optional)

let autoname = AutoNameDoc()										// o: untitled
let autoname2 = AutoNameDoc(name: "")						// o: untitled
let autoname3 = AutoNameDoc(name: "taxes")			// o: taxes

let untitled = UntitledDoc()										// o: untitled


// required initializers
// ----------------------------------------------------------------------------
class Video {
	var name: String
	
	required init() {self.name = "unknown"}
	init(name: String) {self.name = name}
}
class Movie: Video {
	required init() {										// must specify "required"
		super.init()											// first call the super init
		super.name = "new"}								// can now make changes to super
}
let zoolander = Movie()								// o: new


// auto-call a closure to set default property values
// ----------------------------------------------------------------------------
struct Chessboard {
	let boardColors: [Bool] = {
		var temporaryBoard = [Bool]()
		var isBlack = false
		for i in 1...8 {
			for j in 1...8 {
				temporaryBoard.append(isBlack)
				isBlack = !isBlack
			}
			isBlack = !isBlack
		}
		return temporaryBoard
	}()																		// *this autocalls the closure*
	func squareIsBlackAt(row: Int, column: Int) -> Bool {
		return boardColors[(row * 8) + column]
	}}


// deinitialization
// ----------------------------------------------------------------------------
class Bank {
	static var coinsInBank = 10_000
	static func distribute(coins coinsRequested: Int) -> Int {
		let numberOfCoinsToVend = min(coinsRequested, coinsInBank)
		coinsInBank -= numberOfCoinsToVend
		return numberOfCoinsToVend
	}
	static func receive(coins: Int) {
		coinsInBank += coins
	}}
class Player {										// when instance is set to nil, deinit
	var coinsInPurse: Int
	init(coins: Int) {
		coinsInPurse = Bank.distribute(coins: coins)
	}
	func win(coins: Int) {
		coinsInPurse += Bank.distribute(coins: coins)
	}
	deinit {
		Bank.receive(coins: coinsInPurse)
	}}



// AUTOMATIC REFERENCE COUNTING
// creating strong references (not wanted)
// ----------------------------------------------------------------------------
class Resident {
	let name: String
	init(name: String) { self.name = name }
	var apartment: Apartment?
	deinit { print("\(name) is being deinitialized") }
}

class Apartment {
	let unit: String
	init(unit: String) { self.unit = unit }
	var tenant: Resident?
	deinit { print("Apartment \(unit) is being deinitialized") }
}
var john: Resident?
var unitA: Apartment?

john = Resident(name: "John Apple")
unitA = Apartment(unit: "A")

// linking the strong references together
john!.apartment = unitA
unitA!.tenant = john

// even when set to nil, references are maintained
john = nil
unitA = nil


// creating a weak reference (** has errors **)
// ----------------------------------------------------------------------------
class Resident2 {
	let name: String
	init(name: String) { self.name = name }
	var apartment: Apartment2?
	deinit { print("\(name) is being deinitialized") }
}

class Apartment2 {
	let unit: String
	init(unit: String) { self.unit = unit }
	weak var tenant: Resident2?
	deinit { print("Apartment \(unit) is being deinitialized") }
}
var john2: Resident2?
var unitA2: Apartment2?

john2 = Resident2(name: "John Apple")
unitA2 = Apartment2(unit: "A2")

// linking the weak references together
john2!.apartment = unitA2
unitA2!.tenant = john2							// results in an error (Swift 3.0) -> seems fixed now

// even when set to nil, references are maintained
john2 = nil
unitA2 = nil


// creating an unowned reference (** has errors **)
// ----------------------------------------------------------------------------
class Resident3 {												// may or may not have an apt
	let name: String
	init(name: String) {self.name = name}
	var apartment: Apartment3?
	deinit { print("\(name) is being deinitialized") }
}

class Apartment3 {											// will always have a resident
	unowned let tenant: Resident3					// no need for unit var
	init(place: Resident3) {self.tenant = place}
	deinit { print("\(tenant) is being deinitialized") }
}
// initial value is nil since it is an optional
var john3: Resident3?

// initialize/assign 
// resident has strong ref to apartment
// unowned apartment ref to resident
john3 = Resident3(name: "John Apple")
john3!.apartment = Apartment3(place: john3!)		// forces strong

//john3 = nil							// results in an error (Swift 3.0)


// unowned reference & implicitly unwrapped optional
// ----------------------------------------------------------------------------
class Resident4 {
	let name: String
	var apartment: Apartment4!
	init(name: String, apartment: String) {
		self.name = name
		self.apartment = Apartment4(unit: apartment, tenant: self)
	}
	deinit { print("\(name) is being deinitialized") }
}
class Apartment4 {
	let unit: String
	unowned let tenant: Resident4
	init(unit: String, tenant: Resident4) {
		self.unit = unit
		self.tenant = tenant
	}
}

var john4 = Resident4(name: "John Apple", apartment: "UnitA4")


/*
class Country {
let name: String
var capitalCity: City!
init(name: String, capitalName: String) {
self.name = name
self.capitalCity = City(name: capitalName, country: self)
}
}
class City {
let name: String
unowned let country: Country
init(name: String, country: Country) {
self.name = name
self.country = country
}
}



// initialization chain
// ----------------------------------------------------------------------------
class Shape {
	var numberOfSides:Int
	
	init() {
		numberOfSides = 0
	}
	func desc() -> String {
		return ("I am a shape with no sides")
	}
}

class Rectangle: Shape {
	var length:Int, width:Int
	
	init(length:Int, width:Int) {
		self.length = length
		self.width = width
		super.init()
		numberOfSides = 4
	}
	override convenience init() {    // convenience init here
		self.init(length: 0, width: 0)
		numberOfSides = 0
	}
	override func desc() -> String {
		return ("I am a rectangle with \(numberOfSides) sides, \(length) x \(width), area: \(length * width)")
	}
}

class Square: Rectangle {
	init(length:Int) {
		super.init(length: length, width: length)
	}
	convenience init() {             // convenience init here
		self.init(length: 0)
		numberOfSides = 0
	}
	override func desc() -> String {
		return ("I am a square with \(numberOfSides) sides, \(length) x \(length), area: \(length * length)")
	}
}

// uses convenience init -> 0 sides/length
var square1 = Square()
square1.desc()

// uses square init
var square2 = Square(length: 4)
square2.desc()

// uses convenience init -> 0 sides/length/width
var rectangle1 = Rectangle()
rectangle1.desc()

// uses rectangle init
var rectangle2 = Rectangle(length: 3, width: 4)
rectangle2.desc()


/

// exercise - inheritance
// ----------------------------------------------------------------------------
class Triangle {
	var numberOfSides:Int
	var side1:Int, side2:Int, side3:Int
	
	init() {
		numberOfSides = 0
		side1 = 0
		side2 = 2
		side3 = 0
	}
	init(side1:Int, side2:Int, side3:Int) {
		self.numberOfSides = 3
		self.side1 = side1
		self.side2 = side2
		self.side3 = side3
	}
	func desc() -> String {
		return ("Triangle with \(numberOfSides) sides and my sides are: \(side1), \(side2), \(side3)")
	}
}

class Equilateral: Triangle {
	var same = 0
	
	init(same:Int) {
		super.init(side1: same, side2: same, side3: same)
	}
	
	override func desc() -> String {
		return ("Equilateral triangle with \(numberOfSides) sides all of length: \(same)")
	}
}

var triangle1 = Triangle()
triangle1.desc()

var triangle2 = Triangle(side1: 2, side2: 2, side3: 4)
triangle2.desc()

var triangle3 = Equilateral(same: 3)
triangle3.desc()
*/


// STRUCTS
// ----------------------------------------------------------------------------
struct Rectangle1 {
	var      x:Int = 0,     y:Int = 0
	var height:Int = 0, width:Int = 0
	
	func description() -> String {
		return ("x: \(rect.x), y: \(rect.y), width: \(rect.width), height: \(rect.height)")
	}
}

// create the structure & initialize with defaults
var rect = Rectangle1()

// call the function in the struct
print(rect.description())

// memberwise initialization - create with values
var rect2 = Rectangle1(x: 1, y: 1, height: 2, width: 2)


// initialization - with init (cannot use memberwise)
struct Line1 {
	var   x:Int, y:Int
	
	init() {
		x = 0
		y = 0
	}
}

var line1 = Line1()


// initialization with delegation
struct Line2 {
	var   x:Int, y:Int
	
	init(x:Int, y:Int) {
		self.x = x
		self.y = y
	}
	
	init() {
		self.init(x: 1, y: 2)      // delegates to above init
	}
}

var line2 = Line2(x: 4, y: 6)    // x 4, y 6
var line3 = Line2()              // x 1, y 2


// access/assign values with dot notation
rect.x = 10
rect.y = 10
rect.width = 100
rect.height += 50
// ----------------------------------------------------------------------------



class Circle {
	var radius = 0.0
	func diameter() -> Double {
		return 2 * radius
	}
	func area() -> Double {
		return .pi * radius * radius
	}
}

let circle = Circle()

circle.radius = 5.0

"circle diameter: \(circle.diameter()), area: \(circle.area())"



// class test with variadic method
// ----------------------------------------------------------------------------
class testCalc {
	var Total:Int = 0
	
	func add(num:Int...) -> Int {
		var Total = 0
		for numbers in num {
			Total += numbers
		}
		return Total
	}
}

var myCalc = testCalc()
myCalc.add(num: 2, 2, 7)



// ENUMS
// declaring
// ----------------------------------------------------------------------------
enum SeatPref {												// new data type = UpperCamel
	case window, aisle									// lowerCamel
	case noPreference
}

// declare only
var jenPrefers: SeatPref

// declare and initialize (preferred)
// ----------------------------------------------------------------------------
var royPrefers = SeatPref.window


// assign value
// ----------------------------------------------------------------------------
jenPrefers = .aisle


// can match enum values with switch stmt
// ----------------------------------------------------------------------------
switch royPrefers {
case .window:
	print("Book me a Window seat")
case .aisle:
	print("Book me an Aisle seat")
default:
	print("Surprise me!")
}

// access an enum for returns with where
// ----------------------------------------------------------------------------
enum WeatherType {
	case sun
	case wind(speed: Int)
	case snow
}

func getHappy(weather: WeatherType) -> String? {
	switch weather {
	case .sun, .snow:
		return "amazing"
	case .wind(let speed) where speed < 10:				// let allows access
		return "meh"
	case .wind:
		return "bummer"
	}
}

getHappy(weather: WeatherType.wind(speed: 5))


/*
// initializers
// doesn't work so far and no notes in official doc
// ----------------------------------------------------------------------------
enum SeatPref2 {
	case window, aisle
	case noPreference
	
	init() {
		self = .noPreference
	}
}
var unknownPrefers: SeatPref2



switch unknownPrefers {
case .window:
	print("Book me a Window seat")
case .aisle:
	print("Book me an Aisle seat")
default:
	print("Surprise me!")
}
*/


// associated values
// ----------------------------------------------------------------------------
enum Phone {
	case alphaPhone(area: Int, String)
	case tollFree(area: Int, xchg: Int, ext: Int)
}

let custServ = Phone.alphaPhone(area: 800, "buy-more")
let custServ2 = Phone.tollFree(area: 888, xchg: 555, ext: 1212)

switch custServ {
case .tollFree(let ext, _, _):			// bind specific values
	print("Toll-free, ext: \(ext)")
case let .alphaPhone(a, b):					// bind in front to extract all
	print("Named phone: \(a, b)")
}


// raw values (int)
// ----------------------------------------------------------------------------
enum Alpha: Int {
	case a = 1
	case b, c, d
}

let result = Alpha.a.rawValue + Alpha.d.rawValue   // r: 5
let letterB = Alpha(rawValue: 2)                   // o: b
let letterG = Alpha(rawValue: 7)                   // o: nil (opt)


// raw values (string)
// ----------------------------------------------------------------------------
enum GradesKTo3: String {
	case kindergarten = "K", first = "1st"
	case second = "2nd", third
}

var myKid = GradesKTo3.kindergarten
myKid.rawValue																			// o: K
myKid = .first
myKid.rawValue                                      // o: 1st

let firstGrade = GradesKTo3(rawValue: "1st")        // o: first
let secondGrade = GradesKTo3.second.rawValue        // o: 2nd
let thirdGrade = GradesKTo3.third										// o: third


// recursive enums
// ----------------------------------------------------------------------------
enum AlphaContinued {
	indirect case firstFour(Alpha)
	case f
}

let letterGrade = AlphaContinued.firstFour(Alpha.a)
let reallyBad = AlphaContinued.f

switch letterGrade {
case .firstFour(Alpha.a):
 print("Excellent")
case .f:
	print("Not so good")
default:
	print("Middle")
}


// recursive enums - Official doc example
indirect enum ArithmeticExpression {
	case number(Int)
	case
	addition(ArithmeticExpression, ArithmeticExpression)
	case
	multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
	switch expression {
	case let .number(value):
		return value
	case let .addition(left, right):
		return evaluate(left) + evaluate(right)
	case let .multiplication(left, right):
		return evaluate(left) * evaluate(right)
	}
}

print(evaluate(product))



// enum - instance methods
// ----------------------------------------------------------------------------
enum Phone2 {
	case tollFree(Int, Int, Int)
	case internalExtension(Int)
	
	func ext() -> String {
		var resultExt = ""
		
		switch self {
		case .tollFree(_, _, let xtnsn):
			resultExt = "Toll-free extension, \(xtnsn)"
		case .internalExtension(let xtnsn):
			resultExt = "Internal extension, \(xtnsn)"
		}
		return resultExt
	}}

var custServ3 = Phone2.internalExtension(5)
custServ3.ext()                              // o: Internal 5

custServ3 = .tollFree(800, 555, 1212)
custServ3.ext()                              // o: Toll-free 1212


// enum - additional instance method
//enum Lightbulb {
//	case On; case Off
//	
//	func surfaceTemp(ambient: Double) -> Double {
//		switch self {
//		case .On:
//			return ambient + 150.0
//		case .Off:
//			return ambient
//		}}}
//
//var bulb = Lightbulb.On
//let ambientTemp = 77.0
//var bulbTemp = bulb.surfaceTemp(ambient: ambientTemp)
//print("\(bulbTemp)")

/*
// enum - book exercise
// ----------------------------------------------------------------------------
enum Day {
	case sunday, monday, tuesday, wednesday
	case thursday, friday, saturday
	
	func isWeekday() -> Bool {
		switch self {
		case .saturday, .sunday:
			return false
		default:
			return true
		}
	}
}

var today: Day
today = .monday
today.isWeekday()

var tomorrow = Day.tuesday
tomorrow.isWeekday()



// enum & struct initializer example
// ----------------------------------------------------------------------------
enum MelonType: String {
	case watermelon = "Watermelon"
	case cantaloupe = "Cantaloupe"
	case honeydew = "Honeydew"
	
	init() {
		self = .watermelon
	}
}

struct Melon {
	var melonType: MelonType
	var seedCount: Int
	var weightInPounds: Double
	
	init() {
		melonType = MelonType()
		seedCount = 0
		weightInPounds = 0.0
	}
	
	init(melonType: MelonType, seedCount:Int, weightInPounds:Double) {
		self.melonType = melonType
		self.seedCount = seedCount
		self.weightInPounds = weightInPounds
	}
	
	func description() -> String {
		return "My \(melonType.rawValue) has \(seedCount) seeds and weighs \(weightInPounds) lbs."
	}
}

var defaultMelon = Melon()
var customMelon = Melon(melonType: .watermelon, seedCount: 7, weightInPounds: 45.1)

defaultMelon.description()

*/
