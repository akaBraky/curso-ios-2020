import UIKit

// Type anotation
var name: String
name = "Tim McGraw" // Se debe especificar el tipo de dato

var age: Int
age = 25

// No se pueden asignar diferentes tipos de datos a los especificados
// El siguiente codigo marcará error
name = 25
age = "Tim McGraw"

// Double es más preciso que Float
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

// Es preferible esto ...
var name = "Tim McGraw"

// ... a esto
var name = String
name = "Tim McGraw"

// Si no se especifica swift sabra el tipo de dato
let age = 25
let longitude = -86.783333
var nothingInBrain = true

