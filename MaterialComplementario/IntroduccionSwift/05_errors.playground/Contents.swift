
import UIKit

func canThrowError() throws {
    //aqui hay codigo que puede causar error
}

do {
    try canThrowError()
    //si llegamos aqui, no ha habido error
} catch {
    //si llegamos aqui, ha habido un error...
}

func makeASandwich() throws {
    
}

do{
    try makeASandwich()
    //Me como el sandwich
} catch {
    //tengo platos limpios... -> Lavar los platos
    //tengo ingredientes -> Ir a hacer la compra
    //tengo hambre -> Esperar dentro de una hora
}

// Aserciones (debug) y Precondiciones (build)

let age = -5
//assert(age>=0, "La edad de una persona no puede ser negatva")

//precondition(age>=0, "La edad de una persona no puede ser negativa")

//... aqui el codigo sigue

if age>10 {
    print("Puedes subir a la montana rusa")
} else if age >= 0 {
    print("Eres demasiado pequeno para la montana rusa")
} else{
    //assertionFailure("La edad de una persona no puede ser negativa")
    preconditionFailure("La edad de una persona no puede ser negativa")
}
