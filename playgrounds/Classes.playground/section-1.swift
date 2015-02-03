
import UIKit

//EXAMPLE OF A CLASS
class Animal {
    var name = "default"
    var age = 0
    var mammal = true
    
    func getDetails() -> String{
        return "This Animal's name is \(name). It is \(age) year(s) old. This is the Mammal Boolean value: \(mammal)."
    }
}

var myAnimal = Animal()
myAnimal.getDetails()
//setting variables
myAnimal.name = "Grizzly Bear"
//see the change
myAnimal.getDetails()

//SUB CLASSING - INHERITANCE (from Animal)
//inherits based on :Animal
class Dog:Animal{
    
    func woof()->String{
        return "Who let the dawgs out?"
    }
}
class Cat:Animal{
    
    func meow()->String{
        return "Mew Mew Meow!"
    }
}

//Creating the different animals
var myDog = Dog()
myDog.name = "Buddy"
myDog.age = 14
myDog.getDetails()
myDog.woof()

var myCat = Cat()
myCat.name = "Charlie"
myCat.age = 2
myCat.meow()

