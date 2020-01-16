import Foundation

print("Ingresa tu peso: ")

if let p = readLine() {
  if let peso = Double(p){
    print("Ingresa tu altura")
    if let a = readLine() {
      if let altura = Double(a) {
        let imc = peso / (altura * altura)
        print("Tu IMC es \(imc)")

        if imc <= 18.4 {
          print("Insuficiente")
        }
        else if imc <= 24.9 {
          print("Normal")
        }
        else if imc <= 29.9 {
          print("Sobrepeso")
        }
        else if imc >= 30 {
          print("Obesidad")
        }
      }
    }
  }
}
