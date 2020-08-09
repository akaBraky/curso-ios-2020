import UIKit

///Struct vs Class

struct SomeStruct {
    //La definicion de la estructura aqui
}
class SomeClass {
    //La definicion de la clase aqui
}

struct Resolution {
    //Stored properties (forman parte de la estructura)
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//creamos un objeto de la estructura o de la clase. utilizando el init()
let someResolution = Resolution()
let someVideoMode = VideoMode()

print(someResolution.width)
someVideoMode.resolution.width = 1280
print(someVideoMode.resolution.width)

//someResolution.width = 1280 No es posible debido a que someResolution es una constante (let)
someVideoMode.frameRate = 30 /*someVideo tambien es una constante pero es una clase,
 La diferencia es que una estructura una vez creada ocupa un espacio en memoria y es inmutable si la declaro como constante
 
 En el caso de un objeto de una clase, lo que tengo es la zona de la memoria que ocupa, las variables en su interior podran
 ir cambiando si se han declarado como variable dentro de las clases
 
 Una estructura definida como constante no podra cambiar sus valores, en cambio la instancia de un objeto si lo puede hacer a
 pesar de ser declarada como constante: Al declarar una instancia de objeto como Constante, significa que Esto no va a cambiar su posicion de memoria, siempre permanecera en el mismo sitio y lo que tenga en el interior no es cosa mia.
 */
print(someVideoMode.frameRate)



///Estructuras: Datos COPIADOS Por Valor.
//inicializador por defecto de la struct
let vga = Resolution(width: 640, height: 480)
vga.width
vga.height

let hd = Resolution(width: 1920, height: 1080)
//En STRUCT: Copia por valor, por lo tanto no se modificara hd (Tipos evaluados)
var cinema = hd

print("\(cinema.width) x \(cinema.height)")
cinema.width = 2048
print("\(cinema.width) x \(cinema.height)")
print("\(hd.width) x \(hd.height)")

//Enumerados tambien es copia por valor (Tipos evaluados)
enum CompassPoint{
    case north, south, east, west
}

var currentDirection = CompassPoint.north
let oldDirection = currentDirection
currentDirection = .south

print(currentDirection)
print(oldDirection)


///CLASES: Datos Referenciados NO son evaluados

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
tenEighty //tambien ha sido modificado el frameRate de tenEighty Los DOS han sido Modificados
//Los objetos de una clase se comparan con ===
if tenEighty === alsoTenEighty { //!==
    print("Son el mismo objeto")
}else{
    print("Son diferentes")
}
/*Al hacer la copia de la instancia de una clase, los dos no son copias el uno del otro
 Sino que son referencias a la misma POSICION DE MEMORIA, cambiar uno cambiara a la otra
 y viceversa
*/
