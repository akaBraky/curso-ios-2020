import UIKit

//COLECCIONES: cualquier coleccion puede ser mutable o inmutable

///ARRAYS, Formas de inicializar
var someInts = [Int]() //inicializacion array vacio
someInts.count
someInts.append(31)
someInts.count
someInts = [] //vaciamos array

var someDouble = Array(repeating: 3.141592, count: 3)
someDouble.count

var moreDoubles = Array(repeating: 2.5, count: 4)

var aLotOfDoubles = someDouble + moreDoubles
print(aLotOfDoubles)


var shoppingList: [String] = ["Papas", "Pimiento", "Tortillas", "Cerdo", "Cebolla"]
shoppingList.count

let fathers = ["Papa", "Mama"]
let sisters = ["Brenda", "Nancy", "Ana"]
let me = ["Martin"]

var family = fathers + sisters + me
print(family)


//ACEDER Y MODIFICAR ELEMENTOS DE UN ARRAY
if shoppingList.isEmpty {
    print("La lista de la compra esta vacia")
} else {
    print("Mandemos a Martin a comprar")
}


shoppingList.append("Coca Cola")
shoppingList.count

shoppingList += ["Totopos", "Guacamole", "Pico de gallo"]
shoppingList.count

var firstElement = shoppingList[0]
shoppingList[0] = "Huevos"
shoppingList
shoppingList[5]
shoppingList[4...6] = ["Naranja", "Platano", "Mango"]
shoppingList

let pepper = shoppingList.remove(at: 1)
shoppingList

let _ = shoppingList.removeLast()
let _ = shoppingList.removeFirst()
shoppingList


//ITERANDO EN ARRAYS
for item in shoppingList {
    print(item)
}

for (idx, item) in shoppingList.enumerated() {
    print("Item \(idx+1): \(item)")
}

for (idx, item) in family.enumerated() {
    print("Familiar \(idx+1): \(item)")
}






///CONJUNTOS (Set): la forma mas basica de almacenar objetos SIN UN ORDEN PARTICULAR
//Solo se puede crear un conjunto de cosas que sean ordenables
var letters = Set<Character>() //conjuto vacio
letters.count
letters.insert("a")
letters.insert("h")
letters.insert("b")
letters

var favouriteGames : Set<String> = ["Final Fantasy", "World of Warcraft", "Farcry"] //[] conjunto vacio
favouriteGames.count

if favouriteGames.isEmpty {
    print("No hay juegos favoritos")
}

favouriteGames.insert("Metal Gear")

//Se utiliza un if let para remover debido a que tenemos que manejar el caso de que removedGame sea Nil
if let removedGame = favouriteGames.remove("Farcry"){
    print("He eliminado de la lista \(removedGame)")
}

if favouriteGames.contains("Metal Gear"){
    //favouriteGames.remove("Metal Gear")
    print("Me encanta ese juego")
}

for vg in favouriteGames.sorted() {
    print(vg)
}

var favouriteMovies: Set<String> = ["Joker", "Interestellar", "The big short", "The wolf of wallstreet", "Once upon a time in hollywood"]
favouriteMovies.insert("Joker")
print(favouriteMovies.insert("Joker"))
print(favouriteMovies)


//ITERACIONES Y OPERACIONES SOBRE CONJUNTOS

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let primeNumbers: Set = [2,3,5,7]

//A union B = elementos que son o bien de A, o bien de B o de los dos
oddDigits.union(evenDigits).sorted()

//A interseccion B = elementos que son a la vez de A y de B
oddDigits.intersection(evenDigits)
evenDigits.intersection(primeNumbers).sorted()
oddDigits.intersection(primeNumbers).sorted()

//A - B = elementos que son de A pero no de B
oddDigits.subtracting(primeNumbers).sorted()


//A + B = (A - B) union (B - A)  Union simetrica
oddDigits.symmetricDifference(primeNumbers).sorted()

let houseAnimals: Set = ["🐶","🐱"]
let farmAnimals: Set = ["🐮","🐔","🐶","🐑","🐱"]
let cityAnimals: Set = ["🐀","🕊"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
//A y B son disjuntos si su interseccion es vacia (no tienen elementos en comun)
farmAnimals.isDisjoint(with: cityAnimals)




///DICCIONARIOS [k1:v1, k2:v2, ....]
var namesOfIntegers = [Int: String]()
namesOfIntegers[15] = "Quince"
namesOfIntegers = [:] //vaciamos el diccionario

var airports: [String: String] = ["YYZ": "Toronto", "DUB": "Dublin", "PMI": "Palma de Mallorca"]
airports.count
airports.isEmpty
airports["LHR"] = "London City Airport"
airports["LHR"] = "London Heathrow"
airports

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    print("El aeropuerto tenia antiguamente el nombre de \(oldValue)")
}
airports

if let airportName = airports["DUB"]{
    print("El aeropuerto de DUB es: \(airportName)")
}


airports["PMI"] = nil //removemos elemento del diccionario
airports

if let removedAirport = airports.removeValue(forKey: "DUB"){
    //usar la variables removedAirport
}
airports

var familySimpson: [String: Int] = ["Homero": 52, "Marge": 51, "Terry": 30, "Sherri": 30, "Bart": 23, "Lisa": 17]

for (nombre, edad) in familySimpson {
    print("Familia Simpson: \(nombre) \(edad) anos")
}


//ITERACION EN DICCIONARIOS

for (key, value) in airports {
    print("\(key) - \(value)")
}

for airportKey in airports.keys {
    print(airportKey)
}

for airportName in airports.values {
    print(airportName)
}

let airportKeys = [String](airports.keys.sorted())
let airportNames = [String](airports.values.sorted())
