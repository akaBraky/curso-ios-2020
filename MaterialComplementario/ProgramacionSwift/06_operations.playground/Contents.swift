import UIKit

//Operadores Unarios (un solo elemento)

//Operadores Binarios (dos elementos)

//Operadores Ternarios (tres elementos)
let b = 10
var a = 5
a = b


let (x,y) = (1,2)

if a == b {
    print("Los valores de a y b son iguales")
}

1+2
2-3
2*3
10.0/2.5

"Hello" + "World"

9/4
9%4

9 == 4*2+1

let five = 5
let minusFive = -five
let plusFive = -minusFive

let minusSix = -6
let alsoMinusSix = +minusSix

var number = 5
number += 3
number -= 2
number *= 2
number -= 8
number /= 2
number %= 2

var decimalNumber = 8.0
decimalNumber.formTruncatingRemainder(dividingBy: 1.5)


/*
 
 */

1 == 1
1 == 2

1 != 2
1 != 1

2 > 1
2 < 1

2 >= 1
1 >= 1
2 <= 1

let name = "Juan Gabriel"

if name == "Juan Gabriel" {
    print("Bienvenido \(name), eres invitado a la fiesta")
} else {
    print("Cuidado, ha aparecido un \(name) salvaje")
}


(1, "Juan Gabriel") < (2, "Luis Martin")

//Es verdad por que J es antes que L en el alfabeto
(3, "Juan Gabriel") < (3, "Luis Martin")

(4, "perro") == (4, "perro")

//los booleanos no tienen orden
//("perro", false) < ("perro",true)





//Operador Ternario

/*
 if question {
    answer1
 } else {
    answer2
 }
 */

let contentHeight = 40
var hasImage = true
var rowHeight = 0

//Operador Ternario estructura basica
if hasImage {
    rowHeight = contentHeight + 50
} else {
    rowHeight = contentHeight + 10
}

//Operador Ternario forma Swift
rowHeight = contentHeight + (hasImage ? 50 : 10)





//Operador Nil Coalescing

let defaultAge = 18
var userAge: Int?

// ?? Nil Coalescing Operator
var ageToBeUsed = userAge ?? defaultAge
// ageToBeUsed = (userAge != nil ? userAge! : defaulAge)


let defaultColorName = "red"
var userColorName: String? = "green"

var colorNameToUse = userColorName ?? defaultColorName

let defaultUserName = "Ricks"
var userName: String?

//userName = "Luis Martin Maceda Nazario"
let userNameToBeUsed = userName ?? defaultUserName





//Rango de valores

//for cerrado: Imprime todos los valores del rango
for idx in 1...5 {
    print(idx)
}

//for semi abierto:  Imprime solo del primer valor del rango hasta uno antes del ultimo (Este operador se utiliza al utilizar arrays)
for idx in 1..<5{
    print(idx)
}

let names = ["Ricardo", "Juan Gabriel", "Pedro"]

for i in 0..<names.count{
    print("La persona \(i+1) se llama \(names[i])")
}


//for de un solo valor
for name in names[0...] {
    print(name)
}

print("\n")
for name in names[...2] {
    print(name)
}

let range = ...5 //-infinito...5
range.contains(4)
range.contains(7)
range.contains(-2)
range.contains(5)


let range2 = 5... //-infinito...5
range2.contains(10)
range2.contains(4)
range2.contains(100000)

let range3 = 0...100 //



// Operadores Logicos AND(&&) OR(||) NOT(!)

let allowEntry = false

if !allowEntry{
    print("Acceso denegado")
}

let enterDoorCode = true
let passRetinaScan = false

if enterDoorCode && passRetinaScan {
    print("Bienvenido a la empresa")
}else{
    print("Acceso Denegado")
}

let hasMoney = true
let hasInvitation = false
if hasImage || hasInvitation {
    print("Bienvenido a la fiesta")
}else{
    print("No eres bienvenido aqui...")
}

if (enterDoorCode && passRetinaScan) ||
    hasMoney || hasInvitation{
    print("Has entrado")
}
