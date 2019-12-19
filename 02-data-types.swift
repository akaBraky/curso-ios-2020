import UIKit

/* Ejemplo 1
 * Se muestra el uso de 'type annotations'
*/
var name: String
name = "Rodrigo"


/* Ejemplo 2 */

var name: String
name = "Rodrigo"

var age: Int
age = 21

/* Ejemplo 3
 * Prueba negativa: debe fallar
 * Falla porque los tipos de datos son incompatibles
*/

name = 25
age = "Francisco"


/* Ejemplo 4
 * Float vs Double
*/

var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333

/* Ejemplo 5
 * Precision de float
*/

var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333

/* Ejemplo 6
 * Existe el tipo de dato Bool
*/

var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat: Bool
missABeat = false


/* Ejemplo 7
 * Swift usa inferencia de tipos
*/

var age = 25
var longitude = -86.783333
var nothingInBrain = true

/* Ejemplo 8
 * Se puede hacer type annotations e inicializar la variable
*/

var name: String = "Rodrigo Francisco"