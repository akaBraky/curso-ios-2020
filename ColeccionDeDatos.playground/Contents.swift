import UIKit

// Arreglo mutable
var estudiantes = ["jodry", "Martin", "Andrea"]

// Areglo inmubtable
let estudiantesLet = ["Rodrigo"]

// Areglo vacio
// var vacio: [Int] = []
var vacio = [Int]()

vacio = (Array(repeating: 2, count: 3))

//.count
estudiantes.count

// Imprimir arr
print(estudiantes)

// Agregar elementos
estudiantes.append("Samuel")
estudiantes.insert("Fernando", at: 2)

// Eliminar
estudiantes.remove(at: 1)
estudiantes.removeFirst()
estudiantes.removeLast()
print(estudiantes)
estudiantes.removeAll()

// Acceder a los elementos de un arreglo
    // Comprobar si existe un elemento

var jugadores = ["Pancho", "Pedro","Niko", "Juan"]

var jugadorContieneRodrigo = jugadores.contains("Rodrigo")
print(jugadorContieneRodrigo)

jugadores.isEmpty ? "Esta vacio" : "Jugadores registrados"

// Primer elemento y elemento valor màs pequeño

jugadores.first

print(jugadores.first!)

print(jugadores.min()!)

// Iterar entre un arreglo
print("Iteracion ...")
for jugador in 0..<jugadores.count {
    print(jugadores[jugador])
}

// Ordenamiento
jugadores.sort{ (jugador1, jugador2) -> Bool in
    return jugador1 < jugador2
}

print(jugadores)

// Ejercicio1 : Recorrer el arreglo, se debe iterar en el y si nuestro nombre no se encuentra, tiene que agregarlo.
// Forma 1
var targetName = "Rodrigo"
var nombres = ["Jordy", "Mike"]
var nombresContainsNombre = false
print("Antes...")
print(nombres)
for it in 0..<nombres.count {
    if targetName == nombres[it] {
        nombresContainsNombre = true
    }
}

if !nombresContainsNombre {
    nombres.append(targetName)
}
print("Despues...")
print(nombres)

// Forma 2
targetName = "Juan"
print("Forma optima")
!nombres.contains(targetName) ? nombres.append(targetName) : nil
print(nombres)


// Forma 3
targetName = "Rodolfo"
nombresContainsNombre = false
nombres.forEach{ nombre in
    if nombre == targetName {
        nombresContainsNombre = true
    }
}

if !nombresContainsNombre {
    nombres.append(targetName)
}
print(nombres)

// Diccionario
// [ key: value]
// Esta coleccion no tiene ningun orden.
// las llaves y los valores debe ser de un tipo de dato

var directorio = ["Martin" : 556512347, "Andrea": 5523911,]

//var diccionarioVacio: [String:Int] = [:]
var diccionarioVacio = [String:Int]()

// Capacidad de nuestro diccionario
directorio.reserveCapacity(5)

// Acceder a los valores de un diccionario
print(directorio["Martin"]!)

// Evita que la app truene! :x
func containtsName(name:String){
    guard let nameNumber = directorio[name] else {
        print("\(name) no esta en el directorio")
        return
    }
    print(nameNumber)
}

containtsName(name:"Samuel")

// Métodos del diccionario

// Cambiar el valor de una llave o hacer un update

directorio.updateValue(66721242348, forKey: "Andrea")
//directorio.updateValue(66721242348, forKey: "Samuel")
print(directorio)

directorio["Martin"] = 2323482348
print(directorio)

// Eliminar elementos del diccionario

directorio.removeValue(forKey: "Andrea")
print(directorio)
containtsName(name: "Andrea")

directorio["Martin"] = nil
print(directorio)
containtsName(name: "Martin")

directorio = ["Martin" : 556512347, "Andrea": 5523911,"Rodrigo": 12124141, "Fernando": 13418719, "Samuel": 90128395]

// Iterando en un diccionario
for (nombre, numero) in directorio {
    print("El número de \(nombre) es \(numero)")
}

for nombre in directorio.keys {
    print(nombre)
}
for numeros in directorio.values{
    print(numeros)
}

// Sets
// Son colecciones desordenadas con un valor único del mismo tipo.
// Nos ayudan a segurar que un elemento no se repita o aparezca mas de una vez en la colección
// el orden de estos no es importante

let conjuntoUno: Set<Int> = [1]
// Literales de un conjunto
// No tienen sus propias literales. por lo que se ocupan las literales de los arreglos

let arreglo = [ 1, 2, 3, 4]
var conjunto : Set<Int> = [ 1,2,3,4]
var conjuntoSinTipo = Set([1,2,3,3])

conjuntoSinTipo.contains(7)

conjuntoSinTipo.insert(3)
conjuntoSinTipo.remove(1)
print(conjuntoSinTipo)


