//------------------------------------------------------------Error type annotation 
//Manda un error ya que no hemos definido el tipo de dato que será nuestra variable
//var name
//name = "Andrea"
//Haciendolo de forma correcta
var name: String
name = "Andrea"
var age: Int
age = 22
//Asignando otro tipo de dato del que declaramos
//name = 22
//age = "Andrea"
//-------------------------------------------------------------------Double y Float
var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333

//Precisión de Float
longitude = -86.783333
print(longitude)
longitude = -186.783333
print(longitude)
longitude = -1286.783333
print(longitude)
longitude = -12386.783333
print(longitude)
longitude = -123486.783333
print(longitude)
longitude = -1234586.783333
print(longitude)
//--------------------------------------------------------------------------Boolean
var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat: Bool
missABeat = false

//------------------------------------------------------------------Type annotations
//Es preferible esta forma
var nombre = "Andrea"
//A esta...
var nombre2: String
nombre2 = "Andrea"
//--------------------------------------------------------------------Type inference
//Swift sabe el tipo de dato aunque no se especifique en esta forma
var age2 = 25
var longitude2 = -86.783333
var nothingInBrain2 = true
//Combinando las 2 formas de type annotation
var nombre3: String = "Andrea"

