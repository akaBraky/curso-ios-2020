import UIKit

// clase vs estructura
// * semejanzas:
//      * en ambas se pueden declarar propiedades y metodos
//      * pueden ser extendida
//      * Pueden conformar protocolos
//      * Ambos pueden utilizar el método init

class Perro {
    var raza: String? = "Chow Chow"
    var tamano: Int?
    
    func ladrar() {
        print("woa woa")
    }
    
}

struct Animal {
    var especie: String
}

extension Perro{
    //var tamano: Int // Las extensiones no pueden arregar atributos
    func miMascota(raza: String,tamano:Int) {
        print("Tu mascota es de raza \(raza) y su tamaño es: \(tamano)" )
    }
}

extension Animal{
    func tiposDeAnimales() {
        
    }
}

protocol Dueno{
    static var nombreDueno : String {
        get set
    }
    func method()
}

extension Perro: Dueno{
    static var nombreDueno: String = ""
    func method() {
        
    }
}

class Estudiantes{
    var nombre:String
    var edad: Int
    
    init(nombre: String, edad:Int) {
        self.nombre = nombre
        self.edad = edad
    }
}

struct ComunidadAcademica {
    var nombre : String
    var materia: String?
    var edad: Int
    // en las estructuras tienen un inicializador miembro x miembro
    init(nombre:String, materia:String, edad:Int) {
        self.nombre = nombre
        self.materia = materia
        self.edad = edad
    }
}

// clase vs estructura
// * diferencias
//      * classes: son "references type"
//      * structs son "values type"
//      * inicializacion
//      * herencia: en structs no hay, clases, pues sí

class Agenda {
    var numeroReal = 5565012020
}

var numeroCopiado = Agenda()
var numeroRodrigo = numeroCopiado

numeroCopiado.numeroReal = 5565012021

print("numero copiado: \(numeroCopiado.numeroReal), numero Rodrigo: \(numeroRodrigo.numeroReal)")

struct AgendaStruct {
    var numeroReal = 5565012020
}

var numeroCopiadoStruct = AgendaStruct()
var numeroRodrigoStruct = numeroCopiadoStruct

numeroCopiadoStruct.numeroReal = 5565012021

print("numero copiado: \(numeroCopiadoStruct.numeroReal), numero Rodrigo: \(numeroRodrigoStruct.numeroReal)")

class MiPerro: Perro{
    override func ladrar() {
        print("miau miau mi raza es \(raza!)")
    }
}

MiPerro().ladrar()


// ---------- CLASES ---------------------
 
// Control de acceso

//private class ClasePrivada{
class ClasePrivada{
    private let privado = "lol"
    internal let interno = "lel"
    fileprivate let fileprivado = ""
    private func metodoPrivado(){
        
    }
    internal func metodoInterno(){
        
    }
}

public class ClasePublica{

}

// Por defecto es publica
class Clase: ClasePrivada{
    override func metodoInterno() {
        
    }
}

// Propiedades
//  * lazy
//  * computadas
//  * solo lectura
//  * getter
//  * observers

//  * lazy


struct ejemplo {
    lazy var dogg = "Niko"
    
}

class Calculadora {
    var a:Int?
    var b:Int?
    init(a:Int, b:Int) {
        self.a = a
        self.b = b
    }
    //var resultado = self.suma(a!,b!) // marca error si no es lazy
    
    lazy var resultado = self.suma(a!,b!)
    
    func suma(_ a:Int, _ b:Int)->Int{
        return a+b
    }
}

var cal = Calculadora(a:4,b:5)

print(cal.resultado)


class ejemplo2 {
    var computada = {
        print("hola")
    }
}
ejemplo2().computada()

// Enumeraciones

enum dias: Int{
    case lunes = 1
    case martes = 2
    case miercoles
}
var dia = dias.lunes

print(dia.rawValue)

enum meses{
    static let enero: Int = 0
    static let feb : String = "febrero"
    
}


