import UIKit

let age : UInt8 = 33

//UInt = sin signo
//Int = con signo
let minValue = UInt8.min //2^0-1
let maxValue = UInt8.max //2^8-1


//let minValue16 = UInt16.min
//let maxValue16 = UInt16.max
//
//
//
//let minValueSigne = Int8.min
//let maxValueSigne = Int8.max
//
//let minValueSigne16 = Int16.min
//let maxValueSigne16 = Int16.max
//
//
//let minValue32 = Int32.min
//let maxValue31 = Int32.max
//
//let minValuePredeterm = Int.min
//let maxValuePredeterm = Int.max


let f1: Float = 3.14159265

let d1: Double = 3.14159265

let meaningOfLife = 42 //Int
let π = 3.14159 //Double

let anotherπ = 3 + 0.14159 //Double


let decimalInteger = 17 //1*10 + 7
let binaryInteger = 0b10001 //1*2^4+0*2^3+0*2^2+0*2^1+0*2^0
let octalInteger = 0o21
let hexadecimalInteger = 0x11 //1*16^1+1*16^0

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xc.3p0

let paddedDouble = 000123.456
let someNumber = 00000097.540

let oneMillion = 1_000_000
let justMoreThanAMillion = 1_000_000.000_000_1

//let cannotBeNegative: UInt8 = 1 //-1
//let tooBig: UInt8 = UInt8.max //+ 1



///Casting
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let decimalNumber = 0.14159

let piNum = Double(three) + decimalNumber

let integerPi = Int(piNum)


//aplicarle un alias a un tipo de datos existente
typealias AudioSample = UInt16
var maxAmplitude = AudioSample.max // UInt16
