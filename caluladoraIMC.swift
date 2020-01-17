import Foundation

var altura:Float
altura = 1.66
var peso:Float
peso = 66.39
var imc:Float
var edad = 20
imc = peso/(altura*altura)

print("Fernando tu imc es: \(imc) y tu edad es: \(edad) años ")

if imc < 18.5{
    print("Peso inferior al normal")
}else if imc >= 18.6 && imc <= 24.9{
    print("Peso Normal")
}else if imc >= 25.0 && imc <= 30{
    print("Peso superior al normal")
}else{
    print("Obesidad")
}