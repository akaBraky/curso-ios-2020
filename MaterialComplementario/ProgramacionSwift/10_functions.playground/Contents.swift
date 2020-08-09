import UIKit

///FUNCIONES

//Declarar una funcion
func greeting(person: String) -> String{
    let greet = "Hola, \(person)!"
    return greet
}
greeting(person: "Luis Marti")
greeting(person: "Edgar")


//Parametro de entrada
func sayHelloWorld() -> String{
    return "Hello World"
}
sayHelloWorld()
sayHelloWorld()


func greeting(person: String, isMale: Bool, age: Int) -> String{
    if isMale{
        return "Bienvenido Caballero \(person) de \(age) anos"
    } else{
        return "Bienvenida Senorita \(person) de \(age) anos"
    }
}
greeting(person: "Luis Martin", isMale: true, age: 23)
greeting(person: "Olivia", isMale: false, age: 26)



//Valores de Retorno, Optionals y Parametros de salida
func greet2(person: String){
    print("Hola \(person)")
}
greet2(person: "Martin")
greet2(person: "Edgar")


func printAndCount(string: String) -> Int{
    print(string)
    return string.count
}
printAndCount(string: "Hola que tal")

func printWithouCounting(string: String){
    let _ = printAndCount(string: string)
}
printAndCount(string: "Hola que tal")
printWithouCounting(string: "Hola que tal")


func minMax(array:[Int]) -> (min: Int, max: Int)?{
    if array.isEmpty {return nil}
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [6,2,6,4,-1,6,-9,10,100])
print("Los valores se hallan entre \(bounds!.min) y \(bounds!.max)")

minMax(array: [])



//Etiquetas de Parametros (Un alias) y Variadics
func someFunction(f1 firstParamName: Int, f2 secondParamName: Int = 6){
    //firstParamName variable tipo Int
    //secondParamName variable tipo Int
    print(firstParamName + secondParamName)
}
//alias de los parametros
someFunction(f1: 5, f2: 1)
//utilizando el valor por defecto para el segundo parametro
someFunction(f1: 5)

//barra baja para ocultar el nombre del parametro
func greeting(_ person: String, from hometown: String) -> String{
    return "Hola \(person) un placer que nos visites desde \(hometown)"
}
greeting("Luis Martin", from: "Chilpancingo")


//variadic SUPER UTIL!!!!!!
func mean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total/Double(numbers.count)
}
mean(1,2,3,4,5,6,7,8,9)
mean(1.5,4.5,18.75)
mean(3,3,3,4)

func meanQuadratic(_ numbers: Double...) -> Double {
    var total: Double = 1
    for number in numbers {
        total *= number
    }
    print(total)
    return pow(total, 1.0/Double(numbers.count))
}
meanQuadratic(3,3,3,3)


//Parametros tipo inout
var x = 5
func addOne(number: Int){
    var number2 = number
    number2 += 1
    print("El numero ahora vale \(number2)")
}
addOne(number: x)


func swapTwoInts(_ a: inout Int, _ b: inout Int){
    let tempA = a
    a = b
    b = tempA
}
var someInt = 3
var otherInt = 7
print("someInt vale \(someInt) y otherInt vale \(otherInt)")
//& indica que el parametro se da por referencia
swapTwoInts(&someInt, &otherInt)
print("someInt vale \(someInt) y otherInt vale \(otherInt)")



//Function Types
func addTwoInts(_ a: Int, _ b: Int) -> Int{
    return a+b
}//el tipo de dato es (Int, Int) -> Int

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int{
    return a*b
}//(Int,Int) -> Int

func printHW(){
    print("Hello World")
}//() -> Void

var mathFunction: (Int, Int) -> Int = addTwoInts//multiplyTwoInts
mathFunction(4,5)

func printMathResult(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int){
    print("Resultado: \(mathFunc(a,b))")
}
printMathResult(mathFunction, 5, 9)

func stepForward(_ input: Int) -> Int{
    return input+1
}
func stepBackward(_ input: Int) -> Int{
    return input-1
}
stepForward(5)
stepBackward(5)

func chooseStepFunction(backward: Bool) -> (Int) -> Int{
    return backward ? stepBackward : stepForward
}
var value = 7
let moveNearerZero = chooseStepFunction(backward: value>0)
while value != 0{
    print("\(value)...")
    value = moveNearerZero(value) //Duda...como value llega a se parametro de stepBackwar o stepForward
}
print("0...")


//Nested Functions
func chooseStepFunction2(backward: Bool) -> (Int) -> Int{
    func stepForward2(_ input: Int) -> Int{
        return input+1
    }
    func stepBackward2(_ input: Int) -> Int{
        return input-1
    }
    return backward ? stepBackward2 : stepForward2
}
var value2 = 5
let moveNearerZero2 = chooseStepFunction2(backward: value2>0)
while value2 != 0{
    print("\(value2)___")
    value2 = moveNearerZero2(value2) //Duda...como value llega a se parametro de stepBackwar o stepForward
}
print("0___")

