import UIKit

//Arrays

//Es un collection typ
//Es el más común/usado en swift y almacena múltiples valores como las listas
//Colección ordenada de valores

//Arreglo mutable
var estudiantes = ["Jordy", "Martín", "Andrea"]
//Arreglo inmutable
let estudiantesLet = ["Rodrigo"]
//Arreglo vacío
//var vacio : [Int] = []
var vacio = [Int]()
vacio = (Array(repeating: 2, count: 3))

//.count
estudiantes.count

//Imprimir arreglo
print(estudiantes)

//Agregar elementos al arreglo
estudiantes.append("Samuel")
estudiantes.insert("Fernando", at: 2)
//Eliminar elementos
estudiantes.remove(at: 1)
estudiantes.removeFirst()
print(estudiantes)
estudiantes.removeAll()

//Acceder a los elementos de un arreglo
//Comprobar si existe un elemento
//Sólo puede ser de un tipo
//var jugadores = ["Pancho", 5]
var jugadores = ["Pancho", "Pedro", "Juan", "Niko"]
var puntajes = [1,2,3]
var jugadorContieneR = estudiantes.contains("Rodrigo")
print(jugadorContieneR)
//Arreglo vacío
jugadores.isEmpty ? "Esta vacío" : "Jugadores registrados"
jugadores.first
print(jugadores.first!)
print(jugadores.min()!)
print(puntajes.min()!)

//Iterar en un arreglo
for jugador in 0..<jugadores.count{
    print(jugadores[jugador])
}

//sort y sorted --> Crea un nuevo arreglo ordenado

jugadores.sort{
    (jugador1, jugador2) -> Bool in
    return jugador1 < jugador2
}

print(jugadores)

var contains = false
for jugador in 0..<jugadores.count{
    if(jugadores[jugador] == "Andrea"){
        contains = true
    }
}

if(contains == false){
    jugadores.append("Andrea")
}

var contiene = false

jugadores.forEach { jugador in
    if jugador == "Andrea" {
        contiene = true
    }
}

if(contiene == false){
    jugadores.append("Andrea")
}

// Diccionrio
// {Key : Value}
// Esta colección no tiene ningún orden
// Las llaves y los valores deben ser de un solo tipo de dato
var directorio = [ "Martín" : 566666677, "Andrea" : 6666677]
var vacio1 : [String : Int] = [:]
var vacio2 = [String : Int]()

// Capacidad de nuestro diccionario
directorio.reserveCapacity(5)

// Acceder a los valores de un diccionario
print(directorio["Martín"]!)
//print(directorio["Samuel"])

// Evita que la aplicación falle cuando Samuel no este en el diccionario
func containsName(name : String){
    guard let number = directorio[name] else {
        print("\(name) no esta en el directorio")
        return
    }
    print(number)
}

containsName(name : "Samuel")

// Cambiar valores de una llave

directorio.updateValue(555588880, forKey: "Andrea")
print(directorio["Andrea"]!)

directorio["Andrea"] = 123456789

// Eliminar elementos del diccionario
directorio.removeValue(forKey: "Andrea")
//print(directorio["Andrea"])

directorio["Martín"] = nil
containsName(name: "Martín")

// Recorrer el diccionario
directorio = ["Martín" : 123 , "Andrea" : 345, "Rodrigo" : 789, "Fernando" : 368, "Samuel" : 467]

for (nombre,telefono) in directorio{
    print("El número de \(nombre) es: \(telefono)")
}

for nombre in directorio.keys{
    print(directorio[nombre]!)
}

// Conjuntoa o set's
// Son colecciones desordenadas con un valor único del mismo tipo
// Nos ayudan a asegurarse que un elemento no se repita

let conjuntoUno : Set<Int> = [1]
// Literales de un conjunto
// No tienen sus propios literales, por lo que ocupan los literales de los arreglos

let arreglo = [1,2,3]
var conjunto : Set<Int> = [1,2,3,4]
var conjuntoSinTipo = Set([1,2])

print(conjuntoSinTipo)

conjuntoSinTipo.insert(45)
conjuntoSinTipo.remove(1)





