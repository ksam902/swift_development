// Playground - noun: a place where people can play

import UIKit

// Basic
// String Variable
var str = "Hello, my name is"
var name = "Tiffany"
// Integer Variable
var num = 3
var num1 = 5
var num2 = 45
var num3 = 100


// Concatination - String Inturpalation (sp?)
var str1 = "\(str) \(name)!"
var str2 = "The value of num2 is: \(num2)."
var str3 = "Here are all of my variables: \(str), \(name), \(num), \(num1), \(num2) & \(num3)!"

// Forcing the variable to be a certain type of data by using the : followed by the data type.
var strongName:String = "LESTER"
var strongInt:Int = 78

// Basic Math Examples
var output = "Your score is: \(num * num3)"
var output2 = "Division example: \(num2/num1)!"

//CONSTANTS ARE DEFINED WITH THE KEYWORD let
let myName = "Kyle"

//ARRAYS
var colors = ["blue", "red", "green", "yellow", "purple"]
var team2 = colors[1]

//LOOPS
//For Loops
for color in colors{
    println(color)
}
for(var i=0; i<3; ++i){
    println(colors[i])
}

//CONDITIONALS
var fruit = "apple"
var myFruit = "orange"

if(fruit == myFruit){
    println("This is True!")
}else if(fruit == "apple"){
    println("special condition met")
}else{
    println("No conditions met!")
}
//Switch Case Statement
switch fruit{
    case "apple":
        println("This fruit was an \(fruit)")
    case "orange":
        println("The fruit was an \(myFruit)")
    default:
        println("No criteria met.")
}

//FUNCTIONS
// -> Int means the function will return an integer
// the function parameters are declared integer with the :'s
func addMe(num1:Int, num2:Int) -> Int{
    return num1 + num2
}
addMe(2, 5)

//function returns TWO strings
func getNames() -> (String, String){
    return ("Name 1", "Name 2")
}
getNames()























