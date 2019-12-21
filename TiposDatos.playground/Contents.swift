
import UIKit

// Esto es la anotación de la variable, Swift permite la inferencia de datos

var nombre: String
nombre = "Guayna"
var edad: Int
edad = 25

// Marcará error debido a que el tipo de dato no coincide con el asignado

edad = "Tim McGraw"
nombre = 25


/*:
 ##Precisión de Double y Float
 
Float y Double como en el resto de lenguajes de programación tiene la posibilidad de usar Double el doble de precisión que el anterior, por lo que los datos pueden resultar más precisos.
 */

var latitude: Double
latitude = 36.166667 // Se impreme: 36.166667
var longitude: Float

longitude = -86.783333 // Se imprime: -86.78333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333

// Tipo de dato bool
var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat = false

// Swift permite la inferencia de datos, por lo que podemos asignar datos sin necesidad de especificarlo, pero esto carga de más tareas al compilador por lo que es preferible especificar el tipo de dato que estamos trabajando.

let age = 25
let longitud = -86.783333
var nada = true
