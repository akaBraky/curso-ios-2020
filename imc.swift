/*
* @author: Rodrigo Francisco
* @date: 09/01/2020
* @desc: Programa que calcula el imc
*/

import Foundation // Es el import que maneja http://online.swiftplayground.run/

print("Hello World")

var peso:Double
var estatura : Double
var imc : Double

peso = 80 // Se debe pedir el peso en KG
estatura = 1.68 // Se debe pedir la estatura en metros

imc = peso/(estatura*estatura)
// Pequeño truco para imprimir solo dos decimales
var imc_print =  String(format: "%.2f", imc) 
print("Su imc es de \(imc_print)")

if imc < 18.5 {
    print("Peso inferior al normal")
}else if imc>=18.5 && imc<=24.9{
    print("Status:Normal")
}else if imc>=25.0 && imc<=30 {
    print("Status: Peso superior al normal")
}else {
    print("Status: Obesidad :( ")
}