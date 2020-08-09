import UIKit

///ENUMERATIONS, CLASE VAGA
enum SomeEnumeration{
    //aqui iria la definicion del enumerado
}

enum CompassPoint: String{
    case north
    case south
    case east
    case west
}

enum Planet: Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
var directionToGo = CompassPoint.east
directionToGo = .east

switch directionToGo {
case .north:
    print("Hay que ir al norte")
case .south:
    print("Hay pinguinos en el sur")
case .east:
    print("Mordor se extiende hacia las tierras del este")
case .west:
    print("Cuidado con los vaqueros")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("La tierra ess segura")
default:
    print("No es seguro ir a este planeta")
}

enum Beverage: CaseIterable {
    case coffe, tea, juice, redbull
}
let numberOfChoices = Beverage.allCases.count

for beverage in Beverage.allCases{
    print(beverage)
}

enum Smartphone: CaseIterable {
    case IphoneSE, Iphone6s, Iphone7, Iphone8, IphoneX, IphoneXr, IphoneXs, Iphone11
}
let typesOfIphones = Smartphone.allCases.count
for iphone in Smartphone.allCases {
    print(iphone)
}


//ENUMERATIONS, \"Codigo de barras\"

enum Barcode{
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 590, 3235, 3)
productBarcode = .qrCode("ASDFGHJKL")

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("\(productCode)")
}


//ENUMERADORES CON RAW VALUES

//el raw value enum value: rawvalue
enum ASCIIControlCharacter: Character{
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

let earthOrder = Planet.earth.rawValue

let northDirection = CompassPoint.north.rawValue

//El siguiente caso es necesariamente un OPTIONAL
let possiblePlanet = Planet(rawValue: 5)

let planetPosition = -11
if let anyPlanet = Planet(rawValue: planetPosition){
    switch anyPlanet {
    case .earth:
        print("La tierra ess segura")
    default:
        print("No es seguro ir a este planeta")
    }
} else {
    print("El planeta indicado no existe... ")
}

