import UIKit

/**
 * Variables
 */
// var is variable and let is const

// Char
var variableChar: Character = "H"
var variableChar2: Character = "\u{2665}"

print("------- Variables: Char")
print(variableChar)
print(variableChar2)
  
// String
var userName: String = "Fulano"
var greeting = "Hey, \(userName)"

print("------- Variables: String")
print(greeting)

// Int
var userAge: Int = 20
userAge = 30
let userAge2: Int = 40

print("------- Variables: Int")
print("Addition: \(userAge + userAge2)")

// Float
let piFloat: Float = 3.141

print("------- Variables: Float")
print(piFloat)

// Double
let piDouble: Double = 3.141548379876544428191

print("------- Variables: Double")
print(piDouble)

// Bool
var isActive: Bool = true

print("------- Variables: Bool")
print(isActive)

// Aritmetic operators
print("======= Aritmetic operations")
// add
print("------- Add")
var a: Int = 5
var b: Int = 10

var sum: Int = a + b
print(sum)

a = a + b
print(a)

// subtract
print("------- Subtract")
var subtract: Int = a - b
print(subtract)

// multiply
print("------- Multiply")
var multiply: Int = a * b
print(multiply)

// divide
print("------- Divide")
var divide: Int = a / b;
print(divide)

// module
print("------- Module")
var module: Int = a % b
print(module)

// Assignament operators
print("======= Assignament operations")
var exampleAssignament = 7
exampleAssignament = exampleAssignament + 3
exampleAssignament += 10 // Add
exampleAssignament -= 10 // Subtract
exampleAssignament *= 10 // Multiply
exampleAssignament /= 10 // Divide
exampleAssignament %= 10 // Module

print(exampleAssignament)

// Logic operators
print("======= Logic operations")
let age2: Int = 18

let isOlder: Bool = age2 > 18
let isYounger: Bool = age2 < 18
let isEqual: Bool = age2 == 18
let isNotEqual: Bool = age2 != 18
let isOlderOrEqual: Bool = age2 >= 18
let isYoungerOrEqual: Bool = age2 <= 18
let isOlder2: String = age2 > 18 ? "Older" : age2 < 18 ? "Younger" : "Equal"

print("Is Older: \(isOlder)")
print("Is Younger: \(isYounger)")
print("Is Equal: \(isEqual)")
print("Is Not Equal: \(isNotEqual)")
print("Is Older or Equal: \(isOlderOrEqual)")
print("Is Younger or Equal: \(isYoungerOrEqual)")
print("Is: \(isOlder2)")

let isSunny: Bool = true
let temperature: Int = 25

let isPleacent: Bool = isSunny && temperature >= 25
print(isPleacent)

let goToBeach: Bool = temperature >= 25 || isSunny
print(goToBeach)

let wearHat: Bool = !isSunny
print(wearHat)

// Convertions
print("======= Convertions")
let integerNumber: Int = 34
let decimalNumber: Double = 25.65
let superNumber = Double(integerNumber) + decimalNumber
let superNumber2 = integerNumber + Int(decimalNumber)

print("Convert to decimal \(superNumber)")
print("Convert to integer \(superNumber2)")

// let exampleString: String = "123"
// print(Int(exampleString))
// let exampleString2: String = "cual"
// print(Int(exampleString2))

/** Exercise 1
Attendance Record: Declare a variable 'attendances' and assign it a number of attendances to a class.
Declare a variable 'totalClasses' and assign it the total number of classes.
Calculate the attendance percentage using the formula: Percentage = (Attendances / TotalClasses) * 100.
Print the attendance percentage.
 */

print("======= Exercise 1: Calculate the percentage assists")

// way 1: convert to Float or Double
let attendances: Int = 10
let totalClases: Int = 20
// way 2
let resultAttendances: Float = (Float(attendances) / Float(totalClases)) * 100
// way 3
let resultAttendances2: Int = Int((Float(attendances) / Float(totalClases)) * 100)

print("Result assistence is: \(resultAttendances) %")
print("Result assistence2 is: \(resultAttendances2) %")

/** Exercise 2
BMI (Body Mass Index) Calculator:
Declare two variables: weight (in kilograms) and height (in meters).
Calculate the BMI using the formula: BMI = weight / (height * height).
Print the result.
 */

print("======= Exercise 2: Calculate the IMC (body mass index)")
let weight: Float = 80
let height: Float = 1.65
let bmi: Float = weight / (height * height)
print("The BMI is: \(bmi)")

/** Exercise 3
Discount Calculation:
Declare two variables: originalPrice and discountPercentage.
Calculate the price after discount using the formula: discountedPrice = originalPrice - (originalPrice * discountPercentage / 100).
Print the original price and the discounted price.
 */

print("======= Exercise 3: Discount Calculation")

let originalPrice: Double = 17.99
let discountPercentage: Double = 20
let discountedPrice: Double = originalPrice - (originalPrice * discountPercentage / 100)
print("Original price is \(originalPrice) and with discount is \(discountedPrice)")

// Functions
print("======= Functions")

func showMessage(message: String) {
    print("This is my first function and the message is: \(message)")
}
showMessage(message: "How's it going")

func showMyCustomName(name: String) {
    print("The name is: \(name)")
}
showMyCustomName(name: "CUAL")

func calculateSum(a: Int, b: Int) {
    var result = a + b;
    
    print("Sum is: \(result)")
}
calculateSum(a: 10, b: 30)

func calculateSum2(_ a: Int, _ b: Int) {
    var result = a + b;
    
    print("Sum2 is: \(result)")
}
calculateSum2(30, 40)

func calculateSum3(a: Int, b: Int) -> Int {
    var result = a + b
    return result
}

let myResultSum: Int = calculateSum3(a: 3, b: 7)
print("Result function return is: \(myResultSum)")

// IF - ELSE
print("======= IF - ELSE")

let theUserAge: Int = 19
if theUserAge >= 18 {
    print("You are of legal age")
} else {
    print("You are a minor")
}

func greeting(_ hour: Int) {
    if hour < 12 {
        print("Good morning")
    } else if hour < 19 {
        print("Good afternoon")
    } else {
        print("Good evening")
    }
}
greeting(11)

func getMonth(month: Int) {
    if month == 1 {
        print("January")
    } else if month == 2 {
        print("February")
    } else if month == 3 {
        print("March")
    } else if month == 4 {
        print("April")
    } else if month == 5 {
        print("May")
    } else if month == 6 {
        print("June")
    } else if month == 7 {
        print("July")
    } else if month == 8 {
        print("August")
    } else if month == 9 {
        print("September")
    } else if month == 10 {
        print("October")
    } else if month == 11 {
        print("November")
    } else if month == 12 {
        print("December")
    } else {
        print("\(month) it is not a number month")
    }
}
getMonth(month: 9)

func getMonthWithSwitch(_ month: Int) {
    switch month {
    case 1: print("January")
    case 2: print("February")
    case 3: print("March")
    case 4: print("April")
    case 5: print("May")
    case 6: print("June")
    case 7: print("July")
    case 8: print("August")
    case 9: print("September")
    case 10: print("October")
    case 11: print("November")
    case 12: print("December")
    default: print("\(month) it is not a number month")
    }
}
getMonthWithSwitch(4)

func getQuarter(_ month: Int) {
    switch month {
    case 1, 2, 3: print("First quarter")
    case 4, 5, 6: print("Second quarter")
    case 7, 8, 9: print("Third quarter")
    case 10, 11, 12: print("Fourth quarter")
    default: print("\(month) it is not a number month")
    }
}
getQuarter(10)

func getSemester(_ month: Int) {
    switch month {
    case 1...6: print("First semester")
    case 7...12: print("Second semester")
    default: print("\(month) it is not a number month")
    }
}
getSemester(5)

/** Exercise 4
Calculate the area of a circle:
Create a function that takes the radius of a circle and returns its area (PI * radius * radius).
Then print the result on the screen.
 */

print("======= Exercise 4: Calculate the area of a circle")

func calculateCircleArea(radius: Double) -> Double {
    return Double.pi * radius * radius
}
let radius: Double = 7
let areaResult: Double = calculateCircleArea(radius: radius)
print("Area of \(radius) is \(areaResult)")

/** Exercise 5
Create a function that takes a number and using an IF statement prints on screen whether the number is positive, negative, or zero.
 */

print("======= Exercise 5: positive or negative number with IF")

func positiveOrNegativeNumber(number: Int) {
    if number > 0 {
        print("\(number) is positive")
    } else if number < 0 {
        print("\(number) is negative")
    } else {
        print("Number is 0")
    }
}
positiveOrNegativeNumber(number: 10)

/** Exercise 6
Create a function that takes a number and using an SWITCH statement prints on screen whether the number is positive, negative, or zero.
 */

print("======= Exercise 6: positive or negative number with SWITCH")

func positiveOrNegativeNumberSwitch(number: Int) {
    switch number {
    case let x where x > 0: print("\(number) is positive")
    case let x where x < 0: print("\(number) is negative")
    default: print("number is zero")
    }
}
positiveOrNegativeNumberSwitch(number: 12)

/**
 * Arrays
 */

print("======= Arrays")

var daysOfWeek: [String] = ["Monday", "Tuesday", "Wensday", "Thursday", "Friday", "Saturday", "Sunday"]
print(daysOfWeek[4])

daysOfWeek[4] = "Fridayyy";
print(daysOfWeek[4])

print(daysOfWeek[0])
daysOfWeek.remove(at: 0)
print(daysOfWeek[0])

daysOfWeek.append("Day 8")
print(daysOfWeek[6])

/**
 * Loops
 */

print("======= Loops")
var daysOfWeek2: [String] = ["Monday", "Tuesday", "Wensday", "Thursday", "Friday", "Saturday", "Sunday"]

// for i in 1...5 {
for day in daysOfWeek2 {
    if (day == "Thursday") {
        print("It's \(day) on the list")
    }
}

var count: Int = 0
while count < 10 {
    print("WHAT \(count)")
    count += 1
}

// It repear at least one time
var count2 = 5
repeat {
    print("Repeat while \(count2)")
} while count2 < 0

for day in daysOfWeek2 {
    if (day == "Thursday") {
        print("It's \(day) on the list")
        break
    } else {
        print("It's not Thursday")
    }
}

for day in daysOfWeek2 {
    print("------------")
    if (day == "Thursday") {
        print("It's \(day) on the list")
        continue
    }
    print("XXXXXXXXXXXX")
}

/** Execise 7
Write a function that takes a number and prints its multiplication table from 1 to 10.
 */

print("======= Exercise 7: multiplication table")

func multiplationTable(numberToMultiply: Int) {
    
    for i in 1...10 {
        print(i < 10 ? "\(numberToMultiply) x \(i)  = \(numberToMultiply * i)" : "\(numberToMultiply) x \(i) = \(numberToMultiply * i)")            
    }
}

multiplationTable(numberToMultiply: 3)

/** Execise 8
Write a program that calculates the sum of all even numbers from 1 to 100 and displays the result.
To determine if a number is even, the following condition must be met: (number % 2 == 0).
 */

print("======= Exercise 8: sum even numbers from 1 to 100")

func sumEvenNumbers(from: Int = 1, to: Int = 100) {
    
    var sum: Int = 0
    for i in from...to {
        
        if (i % 2 == 0) {
            sum += i
        }
    }
    
    print("Sum of even numbers from: \(from) to: \(to): \(sum)")
    
    var sum2: Int = 0
    for i in from...to {
        
        if (i % 2 != 0) {
            continue
        }
        sum2 += i
    }
    
    print("Sum2 of even numbers from: \(from) to: \(to): \(sum2)")
}

sumEvenNumbers(from: 1, to: 100)

/** Execise 9
Write a program that counts the number of vowels in a word and displays it.
TIP: Words can be iterated through using a for loop.
 */

print("======= Exercise 9: counts the number of vowels in a word")

func vowelCounter(word: String) {
            
    // way 1
    var numberVowels: Int = 0
    for vowel in word {
        
        switch vowel.lowercased() {
            case "a", "e", "i", "o", "u", "á", "é", "í", "ó", "ú": numberVowels += 1
            default: continue
        }
    }
    print("The number of vowels in \(word) is: \(numberVowels)")
    
    // way 2
    let vowels: [Character] = ["a", "e", "i", "o", "u", "á", "é", "í", "ó", "ú"]
    var numberVowels2: Int = 0
    for char in word {
        
        if vowels.contains(char.lowercased()) {
            numberVowels2 += 1
        }
    }
    print("The number of vowels2 in \(word) is: \(numberVowels2)")
}

vowelCounter(word: "cúAlÉs serÍous")


/**
 * Tuples
 */

print("======= Tuples")

let tuple = ("Fulano", 51, true, "The same address", 1235566780, 1.54)

print(tuple.3)

/**
 * Dictionaries
 */

print("======= Dictionaries")

// let dictionary
let dictionary: [String: Any] = ["name": "Fulano", "age": 51, "imHappy": true, "address": "The sama address", "phoneNumber": 1235566780, "height": 1.54]

let myDictionaryName: String = dictionary["name"] as? String ?? "No name"

print(myDictionaryName)

for (key, value) in dictionary {
    print("The key \(key) contains \(value)")
}

/**
 * Nullability
 */

print("======= Nullability")

var varString: String = "Whatever"
// nil it's the equivalent of null in other languages
var varNullable: String? = nil

print(varString)
print(varNullable)

func nilExample(_ text: String) {
    // Do whatever
}

nilExample(varString)
nilExample(varNullable ?? "nilExample")
// similar to Dart and other languages
// nilExample(varNullable!)

func nilExample2(_ text: String?) {
    
    // way 1
    if let example = text {
        print(example)
    } else {
        print("Enter a name to continue")
    }
    
    // way 2
    // if text is nil return
    guard let example2 = text else {
        return
    }
    
    print("Hi, \(example2)")
}

nilExample2(varString)
nilExample2(varNullable)


/**
 * Clases and Struct
 */

print("======= Clases and Struct")

class Person {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func greeting() {
        print("Hey, I'm \(name) and I'm \(age) years old.")
    }
}

var fulano: Person = Person(name: "Fualno", age: 50)
var mengano: Person = Person(name: "Mengano", age: 55)

fulano.greeting()
mengano.greeting()

// Similat to a tuple, but with more power
struct ExampleStruct {
    
    var name: String
    var age: Int
    
    func cual() {
        print("Struct cual")
    }
}

var exampleStruct: ExampleStruct = ExampleStruct(name: "Fulano2", age: 51)
print("struct age: \(exampleStruct.age)")
print("struct func \(exampleStruct.cual())")

/**
 * Introduction to xCode
 */

print("======= Introduction to xCode")
