// Playground - noun: a place where people can play

import UIKit
//---------------------------Basics------------------

// String Variable - Inferred
//var (mutable)
var string1 = "Hello, my name is"

//OR - Explicit - type annotation
// Forcing the variable to be a certain type of data by using the : followed by the data type.
var strongName:String = "LESTER"
var strongInt:Int = 78
var string2:String = "Hello, my name is"
var name:String = "Tiffany"

// Integer Variable
var num: Int = 3
var num1: Int = 5
var num2 = 45
var num3 = 100

//CONSTANTS ARE DEFINED WITH THE KEYWORD let (immutable)
let myName = "Kyle"
let myName2: String = "Thomas"

// Concatination & String Interpolation
var str = string1 + " " + name + "!"
var str1 = "\(string1) \(name)!"
var str2 = "The value of num2 is: \(num2)."
var str3 = "Here are all of my variables: \(string1), \(name), \(num), \(num1), \(num2) & \(num3)!"

// Basic Math Examples
var output = "Your score is: \(num * num3)"
var output2 = "Division example: \(num2/num1)!"

//----------------------COLLECTIONS---------------------

// **type of values you can store in arrays and dictionaries cannot change once the collection is declared.**

// ---1 : ARRAYS---

// var colors: [String] = ["Jack", "Queen", "King"]
var colors = ["blue", "red", "green", "yellow", "purple"]
var team2 = colors[1]

//Combining two Immutable arrays - MUST BE THE SAME TYPE
let a = [1, 2, 3]
let b = [4, 5, 6]
let c = a + b

//Appending to a MUTABLE ARRAY
var array = [1, 2, 3]
array += [4]
println(array)

//Array Operations - Append, Count & Insert
array.append(5)
array.count
array.insert(6, atIndex: 0)


// ---2 : DICTIONARIES---
//Similar to Hash Table - Store key value pairs - Access the value by providing the key

//card names are the keys and the numbers are their values
var cards = ["Jack": 11, "Queen": 12, "King": 13]

//adding to the Dictionary
cards["Ace"] = 14

//change a value
cards["Ace"] = 1
println(cards["Ace"])

//Dictionary Operationals - RemoveValueForKey
cards.removeValueForKey("Jack")
println(cards)

// ---3 : TUPLES--- Differ from Arrays and Dictionaries because they can contain values that are NOT of the same type

//tuple with type string and double
var currency = ("EUR", 0.81)

//tuple with NSDate instance and string literal
var time = (NSDate(), "This is my message.")

//tuple with String String type
var email = ("Bart Jacobs", "bart@example.com", 15678)

//Accessing Values - Zero Based
var rate = currency.1
var message = time.1
var emailAddress = email.0
var emailNumber = email.2

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

// ---1 : OPTIONALS--- use of ? - used to encapsulate
//given default value of nil - IMPORTANT TO NOTE : nil means the absence of a value, any value - used for any type.
//Important to note that word is not of type String but it is of type Optional
var word: String?

//Optional Binding = Safer way to access value of the Optional - Ensures word won't be force unwrapped accidently
if word != nil{
    //force unwrap it - add a ! to the end of the variable - need to make sure it has a value or an error will be thrown
    println(word!)
}else{
    println("word has no value!")
}
word = "Example of an optional"

if let thereIsAWord = word?{
    println(word!)
}else{
    println("word has no value!")
}

//Optional Binding with a temporary Constant
//“If the optional Int returned by possibleNumber.toInt contains a value, set a new constant called actualNumber to the value contained in the
//optional.”
//If the conversion is successful, the actualNumber constant becomes available for use within the first branch of the if statement.
//It has already been initialized with the value contained within the optional, and so there is no need to use the ! suffix to access its value.
let possibleNumber = "123"
if let actualNumber = possibleNumber.toInt() {
    println("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    println("\'\(possibleNumber)\' could not be converted to an integer")
}

// ---2 : CONTROL FLOW---

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

//***parentheses are optional - NEAT!***

//For-in Loops
for cardName in cards{
    println(cardName)
}

//For-in Loops Using Ranges - Important to use 3 .'s
for number in 1...10 {
    println("\(number) times 2 is \(number*2)")
}

for number in 1..<10 {
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

//Using Ranges
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

var tuple3 = (450, "Do not care about me", "You care about me")

switch tuple3 {
    case (0...449,_,let message):
        println("I should not get in here.")
    case (450..<500,_,let message):
        println("If I got into here, you are smart. Pat yourself on the back. \(message)")
        println("This is another way to write message : \(tuple3.2)")
    default:
        println("You are dumb. Nothing matches.")
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
//Swift provides an automatic external name for any parameter that has a default value. 
//The automatic external name is the same as the local name, 
//as if you had written a hash symbol before the local name in your code.
func printDate(date: NSDate, format: String = "YY/MM/dd")-> String{
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.stringFromDate(date)
}
printDate(NSDate())

//changing second parameter - ***Need to tell Swift the parameters name***
printDate(NSDate(), format: "dd/MM//YY")

//function returning three values - labeling the values of the tuples returned
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
func externalNameExample(firstString string1: String, secondString string2: String, joinedString string3: String) -> String{
    
    return "Here is the final string: \(string1) \(string3) \(string2)"
}
externalNameExample(firstString: "what", secondString: "is up?", joinedString: "the heck")

//shorthand external/local paramet naming
func shorthandExternalNameExample(#firstString: String, #secondString: String, #joinedString: String) -> String{
    
    return "Here is the final string: \(firstString) \(joinedString) \(secondString)"
}
shorthandExternalNameExample(firstString: "what", secondString: "is up?", joinedString: "the what the")

func power(base a: Int, exponent b: Int) -> Int{
    var result = a
    for _ in 1..<b{
        result = result * a
    }
    return result
}
power(base: 2, exponent: 3)

//Variadic Parameters - accepts zero or more values of a specified type.
//Write variadic parameters by inserting three period characters (...) after the parameter’s type name.
//The values passed to a variadic parameter are made available within the function’s body as an array of the
//appropriate type.
func addEmUp(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total
}
addEmUp(1, 2, 3, 4, 5)
addEmUp(3, 8.25, 18.75)

//-----------------------CLOSURES---------------------

//What is a Closure? Closures are nothing more than blocks of functionality that you can pass around in your code.
//One of the key advantages of closures in Swift is that memory management is something you, the developer, don't have to worry about.
//Example







