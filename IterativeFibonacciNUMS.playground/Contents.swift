//: Shows why recursion is a poor choice when calculating Fibonacci number series
//Developed by Wylene Sweeney August 06 2015
//Algorithm BigO time and efficiency study in Swift

import UIKit

//interative Fibonacci numbers

var fibNUM = 0
var fibOne = 1
var fibTwo = 0

println(fibNUM)

for j in 0...15 {
    
    fibTwo = fibNUM
    fibNUM += fibOne
    fibOne = fibTwo
    println(fibNUM)
}

//recursive Fibonacci numbers O (n^2) run times are 
//inefficient for large inputs



func FibNumbers (num: Int) ->Int{
    
    if (num == 0){
        return 0
    }
        if (num == 1) {
            return 1
    }else {
    
    return  FibNumbers(num - 1)  + FibNumbers(num - 2)
    }
    
    
}

for k in 0...16{
println(FibNumbers(k))

}

