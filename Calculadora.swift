import Foundation

func suma(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func resta(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func producto(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func division(_ a: Int, _ b: Int) -> Int {
    return a / b
}

print("Ingresa el primer numero")
var numeroUno = readLine()!
var uno = Int(numeroUno)!
print("Ingresa el segundo numero")
var numeroDos = readLine()!
var dos = Int(numeroDos)!
print("¿Qué operacion deseas hacer?")
print("+,-,*,/")
var operacion = readLine()!
switch operacion{
    case "+":
        print("La suma es: ",suma(uno,dos))
    case "-":
        print("La resta es: ",resta(uno,dos))
    case "*":
        print("La multiplicacion es: ",producto(uno,dos))
    case "/":
        print("La division es: ",division(uno,dos))
    default:
        print("Operacion no valida")
}




