// Playground - noun: a place where people can play

import UIKit
//---------------------------Basics------------------

// String Variable - Inferred
//var (mutable)
var string1 = "Hello, my name is"
//OR - Explicit
var string2: String = "Hello, my name is"
var name = "Tiffany"
// Integer Variable
var num = 3
var num1 = 5
var num2 = 45
var num3 = 100

//CONSTANTS ARE DEFINED WITH THE KEYWORD let (immutable)
let myName = "Kyle"
let myName2: String = "Thomas"

// Concatination & String Interpolation (sp?)
var str = string1 + " " + name + "!"
var str1 = "\(string1) \(name)!"
var str2 = "The value of num2 is: \(num2)."
var str3 = "Here are all of my variables: \(string1), \(name), \(num), \(num1), \(num2) & \(num3)!"

// Forcing the variable to be a certain type of data by using the : followed by the data type.
var strongName:String = "LESTER"
var strongInt:Int = 78

// Basic Math Examples
var output = "Your score is: \(num * num3)"
var output2 = "Division example: \(num2/num1)!"

//----------------------COLLECTIONS---------------------

// **type of values you can store in arrays and dictionaries cannot change once the collection is declared.**

// 1 : ARRAYS
// var colors: [String] = ["Jack", "Queen", "King"]
var colors = ["blue", "red", "green", "yellow", "purple"]
var team2 = colors[1]
//Combining two Immutable arrays - MUST BE THE SAME TYPE
let a = [1, 2, 3]
let b = [4, 5, 6]

let c = a + b
//Appending to a MUTABLE
var array = [1, 2, 3]
array += [4]
println(array)
//Array Operations
array.append(5)
array.count
array.insert(6, atIndex: 0)


// 2 : DICTIONARIES
//Similar to Hash Table - Store key value pairs - Access the value by providing the key
//card names are the keys and the numbers are their values
var cards = ["Jack": 11, "Queen": 12, "King": 13]
//adding to the Dictionary
cards["Ace"] = 14
//change a value
cards["Ace"] = 1
println(cards["Ace"])
//Dictionary Operationals
cards.removeValueForKey("Jack")
println(cards)

// 3(?) : TUPLES - Differ from Arrays and Dictionaries because they can contain values that are NOT of the same type
//tuple with type string and double
var currency = ("EUR", 0.81)
//tuple with NSDate instance and string literal
var time = (NSDate(), "This is my message.")
//tuple with String String type
var email = ("Bart Jacobs", "bart@example.com")
//Accessing Values - Zero Based
var rate = currency.1
var message = time.1
var emailAddress = email.0
//Increase Readability -> Name Values in Tuple
var person = (name: "Kyle", age: 25)
let personName = person.name
let personAge = person.age
//Decomposition
let(currencyName, currencyRate) = currency
println("\(currencyName) and \(currencyRate)")
//use _ (underscore) to tell Swift which values you are NOT interested in
let (currencyName2, _) = currency
println(currencyName2)

//-------------------OPTINALS AND CONTROL FLOW--------------------

//Optionals - use of ? - used to encapsulate
//given default value of nil - IMPORTANT TO NOTE : nil means the absence of a value, any value - used for any type.
//Important to note that word is not of type String but it is of type Optional
var word: String?
word = "Example of an optional"
//force unwrap it - add a ! to the end of the variable - need to make sure it has a value or an error will be thrown
println(word!)
//Optional Binding = Safer way to access value of the Optional - Ensures word won't be force unwrapped accidently
if word != nil{
    println(word!)
}else{
    println("word has no value!")
}
//Optional Binding with a temporary Constant
if let wordConstant = word{
    println(wordConstant)
}else{
    println("word has no value!")
}
//CONTROL FLOW

//LOOPS
//While Loop
//while !complete{
//    println("Downloading..")
//}

//Do While Loop
// var message = "Starting to download"
// do{
//    println(message)
//    message = "Downloading..."
// } while !complete

//For-in Loops
for cardName in cards{
    println(cardName)
}
//For-in Loops with range
for number in 1...10 {
    println("\(number) times 2 is \(number*2)")
}
//Printing out both Key and Value
for (cardName, cardValue) in cards {
    println("\(cardName) = \(cardValue)")
}

//For Loops
for color in colors{
    println(color)
}
for var i=0; i<3; ++i{
    println(colors[i])
}

//------------------CONDITIONALS-----------------

var fruit = "apple"
var myFruit = "orange"

if(fruit == myFruit){
    println("This is True!")
}else if(fruit == "apple"){
    println("special condition met")
}else{
    println("No conditions met!")
}
//parentheses are optional - NEAT!
if  fruit != myFruit {
    println("Not Equal")
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
//Using Ranges - Important to use 3 .'s
var distance = 44
switch distance {
case 0:
    println("not a valid distance")
    
case 1..<10:
    println("near")
    
case 10...100 :
    println("far")
    
default:
    println("too far")
    
}
//Value Binding - second value of the Tuple is temporarily bound to the constant description
var response = (200, "OK")

switch response {
case (200..<400, let description):
    println("The request was successful with description \(description).")
case (400..<500, let description):
    println("The request was unsuccessful with description \(description).")
default:
    println("The request was unsuccessful with no description.")
}

//----------------------FUNCTIONS-------------------

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
//function with DEFAULT VALUE for second parameter
func printDate(date: NSDate, format: String = "YY/MM/dd")-> String{
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.stringFromDate(date)
}
printDate(NSDate())
//changing second parameter - need to tell Swift the parameters name
printDate(NSDate(), format: "dd/MM//YY")
//function returning three values (tuple) - labeling the values of the tuples returned
func timeComponentsForDate(date: NSDate) -> (hour: Int,minute: Int,second: Int) {
    let dateComponents = NSCalendar.currentCalendar().components((.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond), fromDate: date)
    let hour = dateComponents.hour
    let minute = dateComponents.minute
    let second = dateComponents.second
    return (hour, minute, second)
}
let timeComponents = timeComponentsForDate(NSDate())

println(timeComponents.hour)
println(timeComponents.minute)
println(timeComponents.second)
//function with external names
func power(base a: Int, exponent b: Int) -> Int{
    var result = a
    for _ in 1..<b{
        result = result * a
    }
    return result
}
power(base: 2, exponent: 3)

//-----------------------CLOSURES---------------------

//What is a Closure? Closures are nothing more than blocks of functionality that you can pass around in your code.
//One of the key advantages of closures in Swift is that memory management is something you, the developer, don't have to worry about.
//Example







