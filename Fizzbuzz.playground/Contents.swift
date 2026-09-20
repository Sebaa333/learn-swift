import UIKit


//Escribe un programa que imprima los números del 1 al 100 (o hasta n), pero con estas reglas:

//Para los múltiplos de 3, imprime "Fizz" en lugar del número.
//Para los múltiplos de 5, imprime "Buzz" en lugar del número.
//Para los múltiplos de 3 y 5 a la vez (es decir, múltiplos de 15), imprime "FizzBuzz".
//Para el resto de los números, imprime el número tal cual.


func runFizzBuzz(){
    for n in 1...100{
        if n % 3 == 0 && n % 5 == 0 {
            print("FIZZBUZZ! \(n)")
        }else if n % 3 == 0{
            print("Fizz \(n)")
        }else if n % 5 == 0{
            print("BUZZ \(n)")
        }else {
            print(n)
        }
    }
}


runFizzBuzz()
