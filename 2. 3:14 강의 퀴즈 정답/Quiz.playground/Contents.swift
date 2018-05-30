//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// while문: 1~10까지의 합
var index = 0, sum = 0

while (index <= 10){
    sum += index
    index += 1 // 안넣어주면 무한루프
}
print ("while문: 1~10까지의 합은 \(sum)입니다.")



// for문 구구단
var i:Int = 1
var j:Int = 1
print("-------------------------------------")
print("")

for i in 2...9
{
    print("\(i)단 입니다.")
    for j in 1...9
    {
        print("\(i) * \(j)  = \(i*j)")
    }
    
}



// for문 : 1~10까지의 합
print("-------------------------------------")
print("")
sum = 0
for i in 1...10
{
    sum += i
}
print ("for문 : 1~10까지의 합은 \(sum)입니다.")


print("-------------------------------------")
print("")



// 별찍기 준비
// ****************************** 이런식으로 찍으려면 ?
for i in 1...30 //  = for(int i=1;i<=4;i++) 
{
    print("*",terminator:"")  //terminator 하면 옆으로 쭉 찍는다. ********* 이런식으로
}
print("")


print("-------------------------------------")
print("")
//*** 이런식으로?
//***
//***
//***
//***
//***
//***
//**
for i in 1...30 //  = for(int i=1;i<=4;i++)
{
    if i%4 == 0
    {
        print()
    }
    else
    {
        print("*",terminator:"")
    }
}
print("")


print("-------------------------------------")
print("")

// 본격 별찍기~ 아래와 같이
//*
//**
//***
//****

for i in 1...4 //  = for(int i=1;i<=4;i++) 자바에선 이렇게
{
   for j in 1...i
   {
    //    print("*")
    print("*",terminator:"")
   }
    print("")
}


print("-------------------------------------")
print("")
// 역으로 별찍기
//****
//***
//**
//*
for i in 1...4
{
    for j in i...4
    {
        print("*",terminator:"")
    }
    print("")
}

// 감소하는 for 문은 어떻게 쓸까요?
//for i in 3..<-3
//{
//    print(i)
//}
print("-------------------------------------")
print("")
for i in (-3..<3).reversed()
{
    print(i)
}



//1-4 별찍기 이런 방법으로도
var star1 = "*"
var starSum1 = ""
var ii = 0;

for ii in 0...3 {
    starSum1 = starSum1+star1
    print(starSum1)
}

print("")




// 리버스 별찍기 이런 방법도
var star2 = "*"
var starSum2 = ""
var j2 = 0;
var jj2 = 0;

for j2 in (1..<5).reversed(){
    for jj2 in jj2..<j2 {
        starSum2 = starSum2+star2
    }
    print(starSum2)
    starSum2 = ""
}


