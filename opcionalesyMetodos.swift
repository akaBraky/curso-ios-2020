//Opcionles y metodos
//para git fernando/opcionales y metodos
import Foundation

//Opcionales
var nombre: String?
var ocupacion: String?
var edad: Int?
var hobbie: String?
nombre = "Fernando"
//Force unwrap
//Recomendable no usar
print(nombre!) //Force unwrap, para desenvolver el opcional
//print(ocupacion!)

//Valores por defecto
//edad = 20
//operador ?? (nil coalescing)
print(edad ?? 23)
edad = 20

//Guard
hobbie = "Jugar videojuegos"
func obtenHobbie() -> String?{
    guard let hobbieObtenido = hobbie else {
        return "no tiene hobbie"
    }
    return hobbieObtenido
}

print(obtenHobbie())

//Metodos funciones
func nombreFuncion(){
    print("Hola soy una funcion")
}

nombreFuncion()

//Párametros de una funcion
func saludo(nombre:String){
    print("hola \(nombre)")
}

saludo(nombre: "Fernando")

//Múltiples parámetros
func saludoPro(nombre:String, ciudad: String){
    print("Bienvenido a \(ciudad), \(nombre), helao?")
}
saludoPro(nombre:"Fernando", ciudad:"CDMX")

//Es lo mismo, pero evitamos poner el nombre de la propiedad
func saludoProSinNombre(_ nombre:String,_ ciudad: String){
    print("Bienvenido a \(ciudad), \(nombre), helao?")
}
saludoPro("Fernando", "CDMX")

//Nombres internos y externos
//Nombre interno = placer
//Nombre Externo = quieres
func paraMasPlacer (quieres placer: Bool){
    if placer == true{
        print("Quisiste mas placer 7u7")
    }else{
        print("No quisiste mas placer :c")
    }
}

paraMasPlacer(quieres: true)

func emojis(e1estaViva e2: Bool, nombreGallina e3: String, e4edad:Int){
    if e2{
        print("Tu rata ha muerto :c")
    }else{
        print("tu pikachu esta vivo :D")
    }
    print("El nombre de tu gallina es \(e3)y la edad de tu vaca es : \(e4edad) años")
}

emojis(e1estaVivo: true, nombreGallina:"Paco", e4edad:10)

//Funciones con retorno
func quienSoy(_ nombre: String) -> String{
    return "Tu eres \(nombre)"
}
quienSoy("Fernando")

//Funciones con retorno opcionales
func existeJulio(nombre:String)->Bool?{
    if nombre != "Julio"{
        return false
    }else{
        return true
    }
    //return nil
}

func desenvolver(){
    guard let julioExiste = existeJulio(nombre:"Fernando") else {
        return 
    }
    print(julioExiste)
}
desenvolver()

//Valores por defecto en una funcion
func circunferencia(pi:Double = 3.1416, radio r:Double) -> Double{
    return pi * pow(r,2)
}

var valorCircunferencia = circunferencia(radio: 4.5)

var valorCircunferencia = circunferena(3.1416151, radio:4.5)

//Hacer una calculadora
//Tarea
calculadora(operacion: "suma", variable1: 4, variable2 :5)




