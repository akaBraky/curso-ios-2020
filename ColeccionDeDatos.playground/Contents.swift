import UIKit

//Arrays(Arerglos) Siempre inician en 0 y estan ordenados
//Es un collection type
//Es el mas comun usado en swift y almacena mutiples valor, como las listas
//Son utiles para almacenar datos en cierto orden

//Existen arreglos mutables(var)
var estudiantes = ["Jordy","Martin","Andrea"]
//Arreglos inmutables(let)
let estudinteLet = ["Rodrigo"]
//Arreglos vacío
var vacio:[Int] = []
var vacio1 = [String]()

//Mandar valor por defeco
vacio = (Array(repeating: 2, count: 3))

//Metodos
//.count Cuenta los elementos que hay dentro del arreglo
estudiantes.count

//Imprimir arreglo
print(estudiantes)

//Agregar elementos
estudiantes.append("Samuel")

//Agregar elemento indicando la posicion
estudiantes.insert("Fernando", at: 2)

//Eliminar elemmentos
estudiantes.remove(at: 1)
estudiantes.removeFirst()
estudiantes.removeLast()
print(estudiantes)
estudiantes.removeAll()

//Acceder a los elementos de un arreglo
//Comprobar si existe un elementos
var jugadores = ["Pancho", "Pedro","juan","Niko"]
var puntajes = [1,2,3]
var jugadorContieneRodrigo = estudiantes.contains("Rodrigo") //Regresa un T o F
print(jugadorContieneRodrigo)

//Arreglo vacio
jugadores.isEmpty ? "Esta vacio" : "jugadores Registrados"

//Primer elemento y elemento valor mas pequeño
jugadores.first
//unwrapper (!), opcionles
print(jugadores.first!)
print(jugadores.min()!)
print(puntajes.min()!)

//Iterar entre un arreglo
for jugador in 0..<jugadores.count{
    print(jugadores[jugador])
}

//For each
jugadores.forEach { (jugador) in
    print(jugador)
}

//Ordenamiento
jugadores.sort { (jugador1, jugador2) -> Bool in
    return jugador1 < jugador2
}

print(jugadores)


var jugadorContieneFernando = jugadores.contains("Fernando")
if (jugadorContieneFernando == false){
    jugadores.append("Fernando")
    print(jugadores)
}else{
    print("El jugador ya esta agregador")
}

/*
 jugadores.forEach { (jugador) in
 if(jugador == "Martin"){
 print("Mi nombre esta adentro")
 }else{
 jugadores.append()
 }
 }*/



//Diccionario
//Compuesto[key : value]
//Esta coleccion no tiene ningun tipo de orden
//Las llaves y los valores deben de ser de un tipo de dato
var directorio = ["Martin": 5527384926, "Andrea":5582910373]

//Diccionaro vacio
var diccionarioVacio: [String: Int] = [:]
var diccionarioVacio1 = [String: Int]()

//Capacidad de nuestro diccionario
//Reservamos memoria
directorio.reserveCapacity(5)

//Acceder a lo valores de un diccionario
print(directorio["Matin"]!)

//Proteger aplicacin para que no se rompa, si no existe algun elemento
func containsName(name: String){
    guard let nameNumber = directorio[name] else{
        print("\(name) no esta en el directorio")
        return
    }
    print(nameNumber)
}

containsName(name: "Samuel")

//Cambiar valores de una llave / hacer un Update

directorio.updateValue(6682193748, forKey: "Andrea")
print(directorio["Andrea"]!)

directorio["Martin"] = 5582916429
print(directorio["Martin"]!)

//Eliminar elementos del directorio
directorio.removeValue(forKey: "Andrea")
containsName(name: "Andrea")

directorio["Martin"] = nil
containsName(name: "Martin")

//Iteracion en el diccionario
var directorio1 = ["Martin": 5527384926, "Andrea":5582910373, "Rodrigo":5582926372, "Fernando":5567978798, "Samuel":5528192037]
for(nombre, numero) in directorio {
    print("El numero de \(nombre) es: \(numero)")
}

//Iterar sobre las llaver
for nombre in directorio.keys{
    print("\(nombre): \(directorio[nombre]!)")
}

for numeros in directorio.values{
    print(numeros)
}

//Conjuntos / sets

//Son colecciones desordenadas con un valor único del mismo tipo
//Nos ayudan a asegurar que un elemento no se repita o aparezca mas de una vez en la coleccion y
// el orden de estos no es importantes

let conjuntos: Set<Int> = [1]
//Literales de un conjunto
//No tienen sus propias literales, por lo que se ocupan las literales de los arreglos
let arreglo = [1,2,3,4]
var conjunto: Set<Int> = [1,2,3,4]
var conjuntoSinTipo = Set([1,2,3,1,3,3,2])

print(conjuntoSinTipo)

//Revisar el contenido
conjuntoSinTipo.contains(3) //Manda un T o F
conjuntoSinTipo.contains(6)

//Agregar un valor
conjuntoSinTipo.insert(4)

//Borrar elemento
conjuntoSinTipo.remove(1)

print(conjuntoSinTipo)









