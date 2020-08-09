import UIKit

///INICIALIZADORES
struct Fahrenheit {
    //Darle un valor por defecto a todo es muy raro
    var temperature: Double // = 32
    init() {
        self.temperature = 32
    }
}

var f1 = Fahrenheit()
struct Celsius{
    var temperature: Double
    
    init(fromFarenheit fahrenheit: Double) {
        self.temperature = (fahrenheit - 32) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        self.temperature = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        self.temperature = celsius
    }
}

let boillingPointOfWater = Celsius(fromFarenheit: 212)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)


//Nombres, etiquetas y optionals
struct Color{
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        self.red = white
        self.green = white
        self.blue = white
    }
}

let magenta = Color(red: 1, green: 0, blue: 1)
let halfGrey = Color(white: 0.5)
let green = Color(red: 0,green: 1,blue: 0)

let bodyTemperature = Celsius(37)

class SurveyQuestion {
    let text: String
    //al ser opcional response, no hace falta inicializarla
    var response: String?
    
    init(_ text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let q1 = SurveyQuestion( "Te gustan los tacos?")
q1.ask()
q1.response = "Si, me encantan todos ellos"
let q2 = SurveyQuestion( "Cual es tu nombre?")
q2.ask()
q2.response = "Luis Martin"

//Inicializadores en Subclases

//Designado -> Desginado super clase

//Conveniencia -> Otro init de la misma clase

//El ultimo init que se llame siempre debe ser designado

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) ruedas"
    }
}

let vehicle = Vehicle()
vehicle.description

class Bicycle: Vehicle {
    //Inicializador Designado
    override init() {
        //siempre se debe empezar con super.init() para un override init()
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
bicycle.description

class Hoverboard: Vehicle {
    var color: String
    //Inicializador por conveniencia
    init(color: String) {
        self.color = color
        //aqui se llama implicitamente a super.init()
    }
    
    override var description: String{
        return "\(super.description) en el color \(self.color)"
    }
}

let hoverboard = Hoverboard(color: "Silver")
print(hoverboard.description)


//Failable Initializer

enum TemperatureUnit {
    case kelvin, celsius, fahrenheint
    
    //init?() puede o no devolver un nil
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheint
        default:
            return nil
        }
    }
}

let someUnit = TemperatureUnit(symbol: "A")

class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty{
            return nil
        }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

//if let someSocks = CartItem(name: "", quantity: ) no va imprimir nada
if let someSocks = CartItem(name: "Socks", quantity: 2){
    print("\(someSocks.name) - \(someSocks.quantity)")
}


//Destruccion de Objetos con deinit

class Bank {
    static var coinsInBank = 2_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        self.coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

//declaramo opcionar y var para poder destruirlo DESINICIALIZAR
var playerOne: Player? = Player(coins: 100)
Bank.coinsInBank
playerOne!.win(coins: 2_000)

Bank.coinsInBank

playerOne = nil
Bank.coinsInBank
