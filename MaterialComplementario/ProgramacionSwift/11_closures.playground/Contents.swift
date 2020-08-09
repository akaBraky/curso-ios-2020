import UIKit

///TIPOS DE CLOSURES

//CLOSURES

//1. Global functions
//2. Nested functions
//3. Clousure

let names = ["Christian","Ricardo","Juan Gabriel","Edgar","Freddy"]

func backward(_ s1: String, _ s2: String) -> Bool{
    print("s1 es: \(s1) s2 es: \(s2)")
    return s1 > s2
}
//backward("Luis Martin", "Felipe Luis")

var reversedNames = names.sorted(by: backward)

/*
 {(params) -> return type in
    //Codigo de closure
 }
 */
//closure de forma general a forma reducida
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })
//reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
//reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
//reversedNames = names.sorted(by: { $0>$1 })
//reversedNames = names.sorted(by: >)


//TRAILING CLOSURES

func someFunctionThatTakesAClosure(closure: () -> Void){
    //Aqui iria el cuerpo de la funcion
}


someFunctionThatTakesAClosure(closure: {
    //Aqui iria el cuerpo del closure
})
someFunctionThatTakesAClosure {
    //Anadir el closure aqui
}
// esta la seria la sintaxis del trailing closure
reversedNames = names.sorted {$0>$1}

let digitNames = [0:"Cero",1:"Uno",2:"Dos",3:"Tres",4:"Cuatro",5:"Cinco",6:"Seis",7:"Siete",8:"Ocho",9:"Nueve"]
let numbers = [16,58,510,2127,-112]

let numberStrings = numbers.map {(number) -> String in
    var number =  number
    var output = ""
    let minus = "menos"
    let negative = number
    
    number = number < 0 ? number * -1 : number
    repeat{
        output = digitNames[number%10]! + output
        print("\(output)")
        number/=10
        print("\(number)")
    } while number>0
    output = negative < 0 ? minus + output : output
    return output
}



//CAPTURAR VALORES (Capturing closures)

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    //capturing closure, capturan los valores runningTotal y amount
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

incrementByTen()


//ESCAPING CLOSURE @ (Closure que no necesariamente se tiene que ejecutar inmendiatamente)

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void){
    completionHandlers.append(completionHandler)
}
completionHandlers.count

func someFunctionWithNonEscapingClosure(closure: () -> Void){
    closure()
}

class SomeClass{
    var x = 10
    func doSomething(){
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonEscapingClosure {
            x = 200
        }
    }
}
let instance = SomeClass()
print(instance.x)

instance.doSomething()
print(instance.x)

completionHandlers.count
completionHandlers.first?()
print(instance.x)
