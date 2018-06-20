//: Playground - noun: a place where people can play

import UIKit
////견고한 프로그래머
 var a = 1
 if 1==a {
    print("hello")
}
 // a=1이 아닌 아래와 같이 하고 혹시 = 를 뺴먹었을때, 컴파일 가능
if 1 == a {
    print("d")
}

//른 프로그래밍에선 이게 그냥 넘어감 true 인식 원래는 a==1 일때만 하려고 의도했지만 말이지
if  a == 1{ 
    print("hello world!" )
}



//var aa = 1
//
//print(aa)
//
//if( 1 == aa ){
//    print("안녕")
//}


// 주석처리 방법
// 정수 실수 "문자열" 불(Bool)
//true false
100==100
100 != 100  //변수 뒤에  바로 !붙이면 다른 의미를 갖기에 띄워야함.
// 사칙연산 + - * / %(실수연산X)
3+10
20.3/12.3
20%3
//20.3%3 //% 나머지는  실수연산은 지원안함

// "가나다"+"가나다"

// print("\(3+2)")
print("\(3+2)") //문자열 안에서 계산값 출력하고 싶으면 \ 슬래시 넣으면 됨,
print("\(3*9)")



var str = "Hello, playground"
print (str)
var i = 100
print (i)

// 상수 선언
let pi = 3.14
//pi = pi+10  //변경이 안됨

// 변수 선언

var itemCount = 10 //int 인걸 확인 하고 싶으면 esc 만 해도 내부적으로 int 임을 알수있음
var itemCount1:Int = 10 //명시적으로 int 표시 해줄수도 있음

itemCount += 50
let height:Double = 1.71
let weight:Double = 64.5
let BMI:Double = weight / (height*height)
//let BMI2 = weight / (height*height) // 가능

var isOK:Bool = false
isOK = true

var helloString1 = "all"
var helloString2 = helloString1 + " hi"

var fruitName = "banana"
var myStr = "I like a \(fruitName)" // \(fruiName) 변수 데이터를 출력하라는것
print(myStr)


// 자료형 변환
let intValue = Int(123.45)

let gumPrice:Int = 100
let pay = Double(gumPrice) * 1.08 // gumPrice 상수 바꾼게 아니고 형을 변환해서 계산에 활용한것. 값은 그대로임
//let payTest = gumPrice * 1.08 // compile error(int인 gumPrice 에 실수를 곱했기에)

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
var dice = 4 //숫자에 따라 출력이 달라짐. if, elseif, else 랑 비슷하다고 보면 됨
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
    d += 7 // d = d + 7
}
print ("Answer is \(d)") //  꼭 \ 활용?  \ 이용 복잡한 계산식 사용할 수도 있으니, 알아두는게 좋은것

// for 문
for i in  0...3 {
    print (i)
}


for i in 0..<3 {
    print(i)
}

for _ in 0..<3 {
    print("\n") // _ 해두면 공백만 3번 반복, 변수 지정안하고 그냥 사용시 이렇게
}
