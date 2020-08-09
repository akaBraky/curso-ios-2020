import UIKit

///METIDIS, SUBINDICES Y HERENCIA

//Metodos de instancia (funciones dentro de una clase o una estructura)
class Counter {
    //count es global para toda la clase
    var count = 0
    
    func increment() {
        //self para ser explicito sobre count como una propiedad de la propia clase
        self.count += 1
    }
    func increment(by amount: Int) {
        self.count += amount
    }
    func reset() {
        self.count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 8)
counter.reset()

struct Point {
    //los valores de una estructura o de un enumerado son inmutables
    var x = 0.0, y = 0.0
    func isToTheRight(of x: Double) -> Bool {
        return self.x > x
    }
    
    //mutating indica que la funcion puede modificar las variables de la estructura o el enumerado
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 4, y: 5)
somePoint.isToTheRight(of: 1)
somePoint.isToTheRight(of: 54)



//Mutating Methods
 struct Point2 {
     //los valores de una estructura o de un enumerado son inmutables
     var x = 0.0, y = 0.0
     func isToTheRight(of x: Double) -> Bool {
         return self.x > x
     }
     
     //mutating indica que la funcion puede modificar las variables de la estructura o el enumerado
     mutating func moveBy(x deltaX: Double, y deltaY: Double) {
         //x += deltaX
         //y += deltaY
        self = Point2(x: self.x + deltaX, y: self.y + deltaY)
     }
 }
var somePoint2 = Point2(x: 4, y: 5)

somePoint2.moveBy(x: 2, y: -3)
somePoint2.x = 9

enum DifferentStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var controllerStatus = DifferentStateSwitch.off
controllerStatus.next()
controllerStatus.next()
controllerStatus.next()
//Con mutating ahora pueden cambiar el valor de sus propia propiedades (Para Struct y Enum)



//Metodos De Clase
class SomeClass{
    class func someMethod() {
        print("Hola")
    }
}

SomeClass.someMethod()

struct LevelTracker{
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int){
        if level > highestUnlockedLevel{
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool{
        return level <= highestUnlockedLevel
    }
    
    mutating func advance(to level: Int) -> Bool{
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        }else{
            return false
        }
    }
    
}

class Player{
    var tracker = LevelTracker()
    let playerName: String
    func complet(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        self.playerName = name
    }
}

var player = Player(name: "Luis Martin")
player.complet(level: 1)
player
player.complet(level: 7)
if player.tracker.advance(to: 7){
    print("Podemos avanzar hasta el nivel 7")
} else{
    print("El nivel 7 sigue bloqueado por ahora")
}



//Subindices

