import UIKit

///TIPOS DE PROPIEDADES
/*Son las variables colocadas en el interior de una estructura o en el interior de una clase
 NO existen en los enumerados
 */

//Stored Properties
struct FixedLenghtRange {
    var firstValue : Int
    let lenght : Int
}
var rangeOfThreeItems = FixedLenghtRange(firstValue: 0, lenght: 3)
rangeOfThreeItems.firstValue = 6 //si rangeOfThreeItems fuera let no se podria hacer este cambio
let rangeOfFourItems = FixedLenghtRange(firstValue: 0, lenght: 4)
//rangeOfFourItems.firstValue = 5 cambia el let por var para evitar el error



//Lazy Stored Properties (propiedades vagas) no se incializa su valor hasta que es necesario

class DataImporter{
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Algo de datos")
manager.data.append("Muchos mas datos")
manager
//Aqui todavia el importer no ha sido inicializado
manager.importer.fileName //Es hasta este momento que se inicializa importer
manager



//Computed Properties (calculadas por un algoritmo y se inicia hasta que son necesarias)

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    //computed propertie
    var center : Point{
        get{
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
            //Forma simplificada (se puede omitir el return) return Point(x: origin.x + size.width/2, y: origin.y + size.height/2)
        }
        set(newCenter){
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }
        /* se puede simplificar el set de la sig. manera (newValue existe por defecto en el setter)
         set{
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
        */
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10, height: 10))
square.center
let initialSquareCenter = square.center
square.center = Point(x: 20, y: 20) //al modificar el centro, tambien modificamos el origen



//Computed Properties de solo lectura (no tiene setter y solo tiene getter)

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double{
            return width * height * depth
    }
}

let cuboid = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
cuboid.volume
//cuboid.volume = 58.0 error, puesto que la variable es de solo lectura

struct Greeting{
    var genere: String
    var language: String
    var name: String
    var initialGreeting: String{
        switch genere {
        case "Hombre":
            return "Hola Mr \(name), me ayudaria a aprender \(language)"
        case "Mujer":
            return "Hola Miss \(name), me ayudaria a aprender \(language)"
        default:
            return "Hola \(name), me ayudaria a aprender \(language)"
        }
    }
}

var greeting = Greeting(genere: "Mujer", language: "Italiano", name: "Florentina")
print(greeting.initialGreeting)
greeting.genere = "Hombre"
greeting.name = "Luiggi"
print(greeting.initialGreeting)



//Property Observers

//willSet (se va a conf antes de cambiar el valor de una propertie)
//didSet (Se va a ejecutar despues de cambiar el valor de dicha propertie)

class StepCounter {
    var totalSteps: Int = 0{
        //se ejecutara automaticamente antes de que el valor de totalSteps cambie
        //willSet por defecto hace referencia al nuevo valor (newTotalSteps)
        willSet(newTotalSteps){
            print("El numero de pasos va a subir hasta el \(newTotalSteps)")
        }
        //se ejecuta despues de cambiar el valor
        //didSet por defecto hace referencia al viejo valor (oldValue)
        didSet{
            if totalSteps > oldValue {
                print("El numero de pasos ha incrementado en \(totalSteps - oldValue)")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 520
stepCounter.totalSteps += 1234

class Player {
    var name: String = "Player 1"
    var life: Int = 50 {
        didSet{
            if life > 100 || life < 0 {
                life = oldValue
            }
        }
    }
}

let player = Player()
player.life = -0



//Type Properties (static)
struct SomeStruct {
    var counter = 0
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 1
    }
}

var instanceStr = SomeStruct()

var otherInstanceStr = SomeStruct()
SomeStruct.computedTypeProperty
SomeStruct.storedTypeProperty

enum SomeEnum{
    static var storedTypeProperty = "SomeValue"
    static var computedTypeProperty: Int{
        return  5
    }
}

SomeEnum.computedTypeProperty
SomeEnum.storedTypeProperty

class SomeClass{
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return -9
    }
    //Las computedProperty que son static son declaradas con classs para que las subclases puedan sobreescribirlas
    //una clase que herede de SomeClass podra sobreescribir overrideableComputedTypeProperty
    class var overrideableComputedTypeProperty: Int {
        return 108
    }
}

class Person {
    var name = ""
    static var budgetFood: Int = 5000
    
    func buyFood() -> Void {
        Person.budgetFood -= 100
    }
}

let Martin = Person()
let Brenda = Person()
Martin.buyFood()
Brenda.buyFood()
Person.budgetFood
