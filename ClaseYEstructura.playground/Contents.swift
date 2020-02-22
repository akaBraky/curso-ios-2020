import UIKit

var str = "Hello, playground"

//Clase y estructura

class Perros{
    var razas: String? = "Chow Chow"
    var tamaño: Int?
    
    func obtenerMiMascota(){
    }
}

struct Animales{
    var especie: String
    
}

//Similitudes
//En ambas se pueden declarar propiedades y métodos
//Ambas sirven para compartir valores
//Pueden ser "Extendidas"

extension Perros{
    func miMascota(raza: String, tamaño: Int) {
        print("Tu mascota es de raza: \(raza) y su tamaño es: \(tamaño)")
    }
}

extension Animales{
    func tipoDeAnimales(){
        
    }
}

//Pueden confrmar protocolos
//Es como un cascaron (Clase abstracta)
protocol Dueño{
    static var nombreDueño: String { get set }
    func method()
}
//Conforma el protocolo
extension Perros: Dueño{
    func method() {
    }
    
    static var nombreDueño: String  = ""
}

extension Animales: Dueño{
    func method() {
    }
    
    static var nombreDueño: String = ""
}

//Ambos pueden ocupar el metodo init() para inicalizar sus propiedades
class Estudiantes{
    var nombre: String
    var edad: Int
    
    init(nombre: String,edad: Int){
        self.nombre = nombre
        self.edad = edad
    }
}

//Inicializador miembro por miembro(Clase no lo tiene, solo struct)
struct ComunidadAcademica{
    var nombre: String
    var materia: String?
    var edad: Int
    init(nombre:String, materia:String, edad:Int) {
        self.nombre = nombre
        self.edad =  edad
        self.materia = materia
    }
}

    //Diferencias
//Clases: son "reference type" (Como apuntadores)
class NumeroTelefonico{
    var numeroReal = 5565012020
}

var numeroCopiado = NumeroTelefonico()
var numeroRodrigo = numeroCopiado

numeroCopiado.numeroReal = 5565012021

print("numero copiado: \(numeroCopiado), numero de rodrigo \(numeroRodrigo)")

//Struct: son "values type"

struct NumeroTelefonicoStruct{
    var numeroReal = 5565012020
}
var numeroCopiadoStruct = NumeroTelefonicoStruct()
var numeroRodrigoStruct = numeroCopiadoStruct

numeroCopiadoStruct.numeroReal = 5565012021

print("numero copiado: \(numeroCopiadoStruct.numeroReal), numero de rodrigo \(numeroRodrigoStruct.numeroReal)")

// Las clases pueden heredar de otras clases, mientras que la estructura no
class MiPerro: Perros{
    override func obtenerMiMascota() {
        print(razas!)
    }
}

MiPerro().obtenerMiMascota()

//Struct no puede heredar
//struct MisPerros: Perros{
//}
//struct MisAnimales: Animales{
//}

// ---------------- Clases ----------------
//Control de Acceso
//private class ClasePrivada{
public class ClasePrivada{
    private let privad = "Lol"
    //Interna: se ocupa dentro de tu modulo
    internal let interno  = "lel"
    fileprivate let fileprivado = ""
    //Solo accede a ella solo en esa clase
    private func metodoPrivado(){
        
    }
    //Puedes acceder a ella heredando
    internal func metodointerno(){
        
    }
}
public class ClasePublica: ClasePrivada{
    override func metodointerno() {
    }
}

//Por default es publica
class ClaseDefault{
}

//Asi como hay clases privadas y publicas, tambien hay estructuras oublicas y privadas

//Propiedades

    //Lazy
//struct ejemplo{
//No ocuoa esoacio de memoria hasta que se ha llamado(utilizada)
//    lazy var doggo = "Niko"
//}
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


//Computadas
class ejemplo2{
    //Variable donde puedes hacer codigo, sigue siendo una propiedad
    var computada = {
        var a = 0
        var b = 1
        print("hola")
    }
}
ejemplo2().computada()

//De solo lectura
//Getter
//Observers


//Enumeraciones
enum Enumeraciones: Int{
    case hola = 5
    case hola2 = 8
    case hola3 = 9
}

//var hola2 = Enumeraciones.hola2.hashValue
var hola2 = Enumeraciones.hola2.rawValue
print(hola2)

enum Enumeracion2{
    static let hola0: Int = 0
    static let hola5: String = "Hola"
}

var hola9 = Enumeracion2.hola0
print(hola9)
