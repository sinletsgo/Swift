//: Playground - noun: a place where people can play

import UIKit


print("\n")
print("------  Quiz : 재귀 함수 설명 (5!합)-----")

func factorial(n:Int)->Int{
    
    if(n == 1) {
        return 1
    }
    else{
        return n * factorial(n: n-1)
    }
}

factorial(n: 5)


print("\n")
print("------  Quiz : 재귀 함수 설명 (100~200합)-----")

func recursiveCall2(start:Int, end:Int)->Int{
    //print("recursiveCall received \(n)")
    if ( start == 0){
        return 0
    }else if ( start >= end ){
        return end
    }else{
        return start + recursiveCall2(start: start+1, end: end)
    }
}

var recursiveResult2 = recursiveCall2(start:100, end:200)
print(recursiveResult2)

print("\n")
print("------  Quiz : 피보나치 수열-----")

func fibo(n:Int)->Int{
    if(n == 0){
        return 0
    }else if(n == 1){
        return 1
    }else{
        return fibo(n:n-1)  + fibo(n:n-2)
    }
}

var fiboResult = fibo(n: 10)
print(fiboResult)
// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946




