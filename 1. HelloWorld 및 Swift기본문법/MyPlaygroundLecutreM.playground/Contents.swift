//: Playground - noun: a place where people can play

import UIKit

// 주석처리 방법
// 정수 실수 "문자열" 불(Bool)
// 사칙연산 + - * / %(실수연산X)
// "가나다"+"가나다"
// print("\(3+2)")
// 100==200 // != > <




var str = "Hello, playground"
print (str)
var i = 100
print (i)

// 상수 선언
let pi = 3.14
// pi = pi+ 10 -> 상수 변경

// 변수 선언
var itemCount:Int = 10
itemCount += 50

let height:Double = 1.71
let weight:Double = 64.5
let BMI:Double = weight / (height*height)
//let BMI2 = weight / (height*height) // 가능

// 변수 선언시 명시적 선언 대신 암묵적으로 선언해도 OK
//var asdf = 10
//asdf // ESC키로 인텔리전스로 확인가능

var isOK:Bool = false
isOK = true

var helloString1 = "all"
var helloString2 = helloString1 + " hi"

var fruitName = "banana"
var myStr = "I like a \(fruitName)"
print(myStr)


// 자료형 변환
let intValue = Int(123.45)

let gumPrice:Int = 100
let pay = Double(gumPrice) * 1.08
//let payTest = gumPrice * 1.08 // compile error

let appleCount = 5
let myMessage:String = "banana " + String(appleCount) + " remains"

let inputString = "100"
let answer = Int(inputString)! * 5

// if 문
var score = 100
if 80 < score {
    print("Good")
}

// if else 문
var score2 = 50
if 80 < score2 {
    print("Good")
} else {
    print("Bad")
}

// if else if, else 문
var score3 = 50
if 80 < score3 {
    print("Good")
} else if score3 > 40 && score3 <= 80 {
    print("Bad")
} else {
    print (">>>????")
}

// switch 문
var dice = 4
switch dice {
case 1:
    print("11111")
case 2, 5, 6 :
    print("2 or 5 or 6")
default :
    print("number is : \(dice)")
}

// while 문
var d = 0
while (d < 100){
    d += 7
}
print ("Answer is \(d)")

// for 문
for i in  0...3 {
    print (i)
}


for i in 0..<3 {
    print(i)
}

for _ in 0..<3 {
    print("\n")
}

