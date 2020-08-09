import UIKit

///CICLO FOR-IN
let names = ["Ricardo Celis", "Juan Gabriel", "Edgar Leon"]

for name in names{
    print("Hola \(name)")
}

let numberOfLegs = ["Spider": 8, "Ant": 6, "Dog": 4]

for (animalName, legCount) in numberOfLegs {
    print("Animal: \(animalName), numero de patas: \(legCount)")
}

for idx in 1...5{
    print("\(idx) x 3 = \(idx*3)")
}

let base = 2
let power = 10
var answer = 1

for _ in 1...power{
    answer *= base
    print(answer)
}

let hour = 9
let minutes = 60
let minuteInterval = 5
//stride(inicio, fin, intervalo)
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print("\(hour) : \(tickMark)")
}

let hours = 24
//let minutes = 60
let hourInterval = 3

for hr in stride(from: 0, to: hours, by: hourInterval) {
    for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
        print("\(hr) : \(tickMark)")
    }
}


///CICLO WHILE

var i = 0
while i <= 10 {
    i += 1
}
print(i)

repeat {
    i += 1
} while i <= 10
print(i)


var min = 2
var max = 100
var noPrimos = Set<Int>()
print("Los numeros primos en el rango 2 a 100: ", terminator: " ")
while min < max {
    for aux in (min+1)...max {
        if aux%min == 0 {
            noPrimos.insert(aux)
        }
    }
    if !noPrimos.contains(min) {
        print("\(min),", terminator: " ")
    }
    min += 1
}

//print(noPrimos)

/*for primo in 2...max {
    if !noPrimos.contains(primo) {
        print("\(primo)", terminator: " ")
    }
}*/



///USO DE IF ELSE
var temp = 26
if temp <= 15{
    print("Hace frio! Enciende la calefaccion")
} else if temp >= 25 {//temp > 15
    //print("Empieza a hacer calor. Apaga la calefaccion")
    print("\n")
    print("Hace calor! Encendamos el aire acondicionado")
} else{
    print("La sensacion termica es agradable. No hace falta modificarla")
}



///USO DE SWITCH
let someCharacter: Character = "Z"
switch someCharacter {
case "a","A":
    print("Es la primera letra del alfabeto")
case "z","Z":
    print("Es la ultima letra del alfabeto")
default:
    print("Es alguna otra letra")
}

let someVocal: Character = "O"
switch someVocal {
case "A","a","E","e","I","i","O","o","U","u":
    print("Es la vocal: \(someVocal)")
default:
    print("No es una vocal")
}


///SWITCH USANDO RANGOS - INTERVAL MATCHING
let moons = 62
let phrase = "Lunas en Saturno"
let naturalCount: String
switch moons {
case 0:
    naturalCount = "No hay"
case 1..<5:
    naturalCount = "Hay unas pocas"
case 5..<12:
    naturalCount = "Hay bastantes"
case 12..<100:
    naturalCount = "Hay decenas de"
case 100..<1000:
    naturalCount = "Hay muchisiiiiisimas"
default:
    naturalCount = "Hay muchisiiiiisimas"
}

print("\(naturalCount) \(phrase)")



///SWITCH USANDO TUPLAS
let somePoint = (-5,7)
switch somePoint {
case (0,0):
    print("El punto \(somePoint) es el origen de coordenadas")
case (_,0):
    print("El punto \(somePoint) se halla sobre el eje de las X")
case (0,_):
    print("El punto \(somePoint) se halla sobre el eje de las Y")
case (-2...2, -2...2):
    print("El punto \(somePoint) se halla en el interior del cuadrado de lado 4")
default:
    print("El punto \(somePoint) esta en algun otro lado")
}


let anotherPoint = (2,-2)
switch anotherPoint {
case (let x, 0):
    print("Sobre el eje de las X, con valor \(x)")
case (0, let y):
    print("Sobre el eje de las Y, con valor \(y)")
case let (x,y) where x == y:
    print("El punto se halla sobre la recta x=y")
case let (x,y) where x == -y:
    print("El punto se halla sobre la recta x = -y")
case let (x,y):
    print("En algun otro lugar del plano, en (\(x), \(y))")
}



///SWITCH CON CASOS COMPUESTOS (Tuplas)

let stillAnotherPoint = (9,0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("Se halla sobre el eje, a distancia \(distance) del origen")
default:
    print("No esta sobre el eje")
}



///SENTENCIAS DE TRANSFERENCIA DE CONTROL - continue, break, fallthrough, return, throw

//Continue y break
let sentence = "Las mentes grandes piensan igual"
var filteredSentence = ""
let charactersToRemove:[Character] = ["a", "e", "i", "o","u"]
for ch in sentence{
    if charactersToRemove.contains(ch){
        continue //finaliza la ejecuccion actual para ir a la sig. iteracion
    }
    filteredSentence.append(ch)
    if ch == "d"{
        break //rompe la ejecucion de un bucle
    }
}
filteredSentence



//Fallthrough (Pasar hacia adelante), Se suele utilizar unicamente en el contexto del switch
let integerToDescribe = 5
var description = "El numero \(integerToDescribe) es"
switch integerToDescribe {
case 2,3,5,7,11,13,17,19:
    description += " un numero primo y"
    fallthrough
default:
    description += " un numero entero"
}
print(description)



//Uso de return y guard: forma de evitar recibir algo que no exites o que es nil
var people = ["name": "Juan Gabriel", "age": 31, "isMale": true] as [String : Any]

//let surname = people["surname"]
if let surname = people["surname"]{
    print(surname)
}

func testUserValidation(person:[String: Any]){
    //Si alguien puede crear variable surname... la sentencia sigue despues de las llaves{}
    //de lo contrario entra al else{...}
    guard let surname = person["surname"] else {
        print("El apellido es desconocido")
        return
    }
    //aqui existe surname
    print(surname)
    
    guard let age = person["age"] else {
        print("El apellido es desconocido")
        return
    }
    //aqui existe surname
    print("La edad de la persona es \(age)")
}

people["surname"] = "Ricks"
testUserValidation(person: people)



///Available en API: Manejo de versiones
if #available(iOS 12, macOS 10.12, *){
    //Ejecutar las acciones a lo iOS12+, a lo macOS10.12+
} else{
    //Mantener el codigo viejo con versiones anteriores de iOS, macOS...
}
