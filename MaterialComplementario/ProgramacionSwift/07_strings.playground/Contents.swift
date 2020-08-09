import UIKit


//STRINGS

//string literal de una sola linea
let someString = "Soy un string"

//string multi-linea
let multiLineString = """


    Soy Luis Martin Maceda y estoy\
    haciendo el curso de swift y creo\
    que estoy aprendiendo mucho...
"""

print(multiLineString)

//STRINGS CON CARACTERES ESPECIALES
let wiseWords = "\"La imaginacion es mas importante que el saber\" - Albert Einstein"

let dolarSign = "\u{24}"

let blackHeart = "\u{2665}"

let heart = "\u{1F496}"

let mexicoFlag = "\u{1f1f2}"
print(mexicoFlag)


//inicializar string vacio y mutabilidad
var emptyString = ""

var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nada para ver aqui")
}else {
    print("El string tiene un valor")
}

var newSomeString = "Un caballo"
newSomeString += "y un carruaje"
newSomeString += "y un soldado"
print(newSomeString)

//inmutable
//let aString = "Juan Gabriel"
//aString += " Y Ricardo Celis"

var a = "A"
var b = "B"
print("a vale \(a) y b vale \(b)")
b = a
print("a vale \(a) y b vale \(b)")
b = "C"
print("a vale \(a) y b vale \(b)")
a = "D"
print("a vale \(a) y b vale \(b)")


//CHARACTERES

let name = "Juan Gabriel 😎"

//contar caracteres del string
for character in name {
    print(character)
}
print(name.count)

let exclamationMark : Character = "!"

//arreglo de caracteres para convertirlo en un string
let nameChars: [Character] = ["J", "u", "a", "n"]
var nameString = String(nameChars)


let compoundName = "Juan" + "Gabriel"


//nameString + exclamationMark no se puede concatenar string y caracter de esta manera
//nameString + String(exclamationMark) esto casteando el caracter a String
//de la siguiente manera se puede agregar un caracter a un string
nameString.append(exclamationMark)

let multiplier = 3
var message = "El producto es \(multiplier) x 3.5 da \(Double(multiplier)*3.5)"
//.append("!") no funcionaria porque el string aun no ha sido formado

message.append(exclamationMark)
print(message)

let myName: [Character] = ["M", "a", "r", "t", "i", "n", " ", "🇸🇳"]
var myNameString: String = String(myName)

for n in 0...10{
    print("5*\(n)=\(5*n)")
}


//INDICES y SUBINDICES STRINGS, es diferente a las posiciones tipo [0], [2]
//ARRAYS Y STRINGS SON DIFERENTES ARRAY[posiciones]  STRING[Indices]
let greeting = "Hola, !que tal?"

//print(greeting[2]) ESTO NO ES ASI, swift tiene INDICES (ARTEFACTOS PARA MANEJAR POSICIONES)

greeting[greeting.startIndex]
//greeting[greeting.endIndex] la mayoria de colecciones empiezan en 0 y terminan en la posicion -1
//Abajo esta la forma en que podriamos acceder al ultimo elemento
greeting[greeting.index(before: greeting.endIndex)]

for idx in greeting.indices{
    //print("\(greeting[idx]) - \(idx)")
    print("\(greeting[idx])", terminator: "")
    //terminator: por defecto es el salto de linea \(n)
}

var welcome = "Hola"
welcome.insert("!", at: welcome.endIndex)
//Hola!

welcome.insert(contentsOf: " que tal", at: welcome.index(before: welcome.endIndex))
//Hola que tal!



welcome.remove(at: welcome.index(before: welcome.endIndex))
welcome //Hola que tal

//obtenemos un rango, del endIndex - 6 lugares A endIndex
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex

//removemos de nuestro string el rango obtenido previamente
welcome.removeSubrange(range)
welcome //Hola q



//SUBSTRINGS: extraer una parte el string original

greeting//"Hola, !que tal?"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
print(index)//indice de la coma

let firstPart = greeting[..<index] //SubString: Almacena del string original a que posiciones de memoria hace referencia, no se puede trabajar como un String

let newString = String(firstPart) //String: Ocupa una posicion de memoria en el dispositivo




//PREFIJOS Y SUBFIJOS
let newGreeting = "Hola, soy Luis Martin"

newGreeting.hasPrefix("Hola") //prefijo
newGreeting.hasSuffix("adios") //subfijo

let collection = [
    "Act 1 Scene 1", "Act 1 Scene 2", "Act 1 Scene 3", "Act 1 Scene 4", "Act 1 Scene 5",
    "Act 2 Scene 1", "Act 2 Scene 2", "Act 2 Scene 3",
    "Act 3 Scene 1", "Act 3 Scene 2"
]

var act1SceneCount = 0
for scene in collection {
    if scene.hasPrefix("Act 1"){
        act1SceneCount += 1 //Contando el numero de escenas para el prefijo Act 1
    }
}
print("El numero de escenas del acto 1 es: \(act1SceneCount)")



//REPRESENTACIONES UNICODE

let ghost = "Fantasma!! 👻"

//utf8
for codeUnit in ghost.utf8{
    print(codeUnit, terminator: " ")
}
print(" ")
for codeUnit in ghost.utf16{
    print(codeUnit, terminator: " ")
}

//unicode
print(" ")
for codeUnit in ghost.unicodeScalars{
    print(codeUnit, terminator: " ")
}

