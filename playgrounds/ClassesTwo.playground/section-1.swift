// Playground - noun: a place where people can play

import UIKit

class TipCalculator {
// PROPERTIES - delcaring constants - Explicit
    let total: Double
    let taxPct: Double
    let subtotal: Double
// INITIALIZER FOR CLASS - Initializers are always named init - this one takes two parameters
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
//FUNCTIONS - Keyword func - Parameters must be explicit
    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }
    //Can use Interpulation to call Fucntions as well
//    func printPossibleTips() {
//        println("15%: \(calcTipWithTipPct(0.15))")
//        println("18%: \(calcTipWithTipPct(0.18))")
//        println("20%: \(calcTipWithTipPct(0.20))")
//    }
    func printPossibleTips() {
        //declaring array with both inferred and explicit typing
        //[Double] is a shortcut for Array<Double>
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit: [Double] = [0.15, 0.18, 0.20]
        for possibleTip in possibleTipsInferred{
            println("\(possibleTip*100)%: \(calcTipWithTipPct(possibleTip))")
        }
        //Alternate For Loop
        //The ..< operator is a non-inclusive range operator and doesn’t include the upper bound value. There’s also a ... operator
        //which is inclusive.
//        for i in 0..<possibleTipsInferred.count {
//            let possibleTip = possibleTipsInferred[i]
//            println("\(possibleTip*100)%: \(calcTipWithTipPct(possibleTip))")
//        }
    }
    func returnPossibleTips() -> [Int: Double]{
        let possibleTips = [0.15, 0.18, 0.20]
        //creating an EMPTY DICTIONARY
        var retval = [Int: Double]()
        for tip in possibleTips{
            let intPct = Int(tip*100)
            retval[intPct] = calcTipWithTipPct(tip)
        }
        return retval
    }
}
//Create instance of TipCalculator Class and call the Method to print all possible Tips
let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
tipCalc.printPossibleTips()
tipCalc.returnPossibleTips()



