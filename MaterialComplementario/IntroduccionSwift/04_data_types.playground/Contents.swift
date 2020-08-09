import UIKit

//Boleanos
let orangesAreOrange = true
let foodIsDelicious = false

var isAged: Bool

isAged = true

if isAged {//Solo entramos aqui, si isAged == true
    print("Puedes entrar en la fiesta")
} else { //Solo entramos aqui, si isAged == false
    print("No puedes pasar a la fiesta")
}

var age = 31

if age>=18 {
    print("Puedes entrar en la fiesta")
}
 


//TUPLAAS

let http404Error = (404, "Pagina no encontrada")
let (statusCode, statusMessage) = http404Error

print ("El codigo del estado es \(statusCode)")
print("El mensaje del servidor es \(statusMessage)")


let (justStatusCode, _) = http404Error
print("El codigo del estado es \(justStatusCode)")

print("El codigo del error es \(http404Error.0) y el mensaje es \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("El codigo del estado es \(http200Status.statusCode) y el mensaje es \(http200Status.description)")

let myName = (name: "Luis Martin", lastName: "Maceda Nazario", age: 23)
print("Mi nombre es \(myName.lastName) \(myName.name) y tengo \(age) a+os")


//OPCIONALES
let possibleAge = "23"
let convertedAge = Int(possibleAge) //Int??

var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?

surveyAnswer = "23"
//print(surveyAnswer!)  ME DARA UN FATAL ERROR


//FORCE UNWRAPPING !
if convertedAge != nil {
    //force unwrapping !
    print("La edad del usuario no es nula: \(convertedAge!)")
} else {
    print("La edad del usuario es nula")
}


//OPTIONAL binding
if let actualAnswer = surveyAnswer {
    //Al llegar aqui, surveyAnswer != nil
    print("El string \(surveyAnswer) tiene el valor \(actualAnswer)")
} else {
    //Al llegar aqui, surveyAnswer = nil
    print("El string \(surveyAnswer) es nil... ")
}


if let firstNumber = Int("4"),
    let secondNumber = Int("23"),
    firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}





let possibleString: String? = "Un string opcional"
let forcedString: String = possibleString!

//UNWRAP IMPLICITO
let assummedString: String! = "Un string unwrapped de forma implicita a partir de un opcional"

let implicitString: String = assummedString

if assummedString != nil {
    print(assummedString!)
}

if let definitiveString = assummedString {
    print(definitiveString)
}

print(assummedString)
