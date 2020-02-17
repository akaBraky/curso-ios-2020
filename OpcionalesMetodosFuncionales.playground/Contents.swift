import Foundation
//Opcionales
var nombre: String!
var ocupacion: String?
var edad: Int?
var hobbie: String?
var n: Int?
nombre="Julio"
//Force unwrap
print(nombre!)
//print(ocupacion!)

//Valores por defecto
//operador ?? (nil coalescing)
print(edad ?? 22)
edad = 20


//Guard
hobbie = "Jugar Halo"
func obtenHobbie () -> String {
    guard let hobbieObtenido = hobbie else{
        return "no tiene hobbie"
    }
    return hobbieObtenido
}
print(obtenHobbie())

//Métodos (funcionales)
func nombreFuncion(){
    print("Hola soy una función")
}

nombreFuncion()

//Parámetros de una función
func saludo (nombre:String){
    print("Hola \(nombre)")
}

saludo(nombre: "Julio")

//Múltuples parámetros
func saludoPro(nombre: String, ciudad: String){
    print("Bienvenido a \(ciudad), \(nombre)")
}

saludoPro(nombre:"Julio", ciudad:"CDMX")

//Nombre internos y externos
//externo: quieres interno: placer
func paraMasPlacer (quieres placer: Bool){
    if placer == true {
        print("Quisiste mas placer 7u7")
    }else {
        print("No quisiste mas placer :c")
    }
}

paraMasPlacer(quieres: true)

func saludoProSinNombre(_ nombre: String,_ ciudad: String){
    print("Bienvenido a \(ciudad), \(nombre)")
}
saludoProSinNombre("Jordy", "CDMX")

func emojis(🐹estáVivo 💀:Bool, nombreTigre 🐯:String, 🐼edad:Int){
    if 💀{
        print("Tu rata ha muerto :c")
    }else {
        print("Tu pikachu esta vivo :D")
    }
    
    print("El nombre de tu tigre es: \(🐯) y la edad de tu panda es: \(🐼edad) años ")
}

emojis(🐹estáVivo: true, nombreTigre: "Benito", 🐼edad: 22)

// Funciones con retornos
func quienSoy(_ nombre: String) -> String{
    return "Tu eres \(nombre)"
}

quienSoy("Julio")

//Funciones con retornos opcionales
func existeJulio(nombre: String) -> Bool? {
    if nombre == "Julio"{
        return true
    }else{
        return nil
    }
}

var julioExiste = existeJulio(nombre: "Fernando")
print(julioExiste ?? false)

func desenvolver(){
    guard let julioExiste = existeJulio(nombre: "Fernando") else{
        return
    }
    print(julioExiste)
}

desenvolver()

//Valores por defecto en una función
func circunferencia(_ pi: Double = 3.1416, radio r: Double) -> Double{
    return pi * pow(r,2)
}

var valorCircunferencia = circunferencia(radio: 20)

var valorCircunferencia2 = circunferencia(3.1416151, radio: 20)

/*
Hacer un calculadora con metodos y opcionales
calculadora(operacion: "suma", numerovariables)
minimo 2
*/

