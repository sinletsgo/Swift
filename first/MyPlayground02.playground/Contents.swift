//: Playground - noun: a place where people can play

import UIKit


// https://stackoverflow.com/questions/37170203/swift-3-for-loop-with-increment
// for(int i=0;i<=10;i+=2)
let first = 40
let last = 20
let interval = -2
var n = 0
for f in stride(from: first, through: last, by: interval) {      // <= : through, < : to
    print(f,terminator:" ")
} // 0 2 4 6 8 10

print("\n")


// 함수
print("------  함수 설명 (입출력 없는 기본형태)-----")
func showHello1(){
    print("Hello")
}
showHello1()





print("\n")
print("------  함수 설명 (입력만 있는 형태)  string-----")

func showHello2(name:String) {
    
    let message = "\(name)씨 안녕하세요!"
    print(message)
}

showHello2(name: "홍길동")



print("\n")
print("------  함수 설명 (입력만 있는 형태)  int -----")

func showHello2(intTest:Int) {
    
    let message = "\(intTest)씨 안녕하세요!"
    print(message)
}

showHello2(intTest: 1004)




// 2개 숫자  더한 결과 반환하는 함수식

func showSum(a:Int, b:Int) -> Int{   // -> 화살표 안주면 에러남. 안에서 결과값을 출력하는 것이 아닌 밖으로 아웃풋을 하겠다는것
    return a+b
}
var result = showSum(a: 2, b: 3)
print(result)


func showSum2(a1:Int, b1:Int){   //-> 화살표 안주면 안에서 결과 출력
    var result = a1 + b1
    print(result)
    
    print("\(a1+b1)")
    
}

showSum2(a1: 2, b1: 3)







print("\n")
print("------  함수 설명 (출력만 있는 형태)-----")
func showHello3() -> String {
    
    let name = "OOO"
    
    return "\(name)씨 안녕하세요!"
}

let msgFromFunction = showHello3()
print(msgFromFunction)

print("\n")







print("------  함수 설명 (입출력이 모두 있는 형태)-----")
func showHello4(name:String) -> String {
    
    
    return "\(name)씨 안녕하세요!"
}
 let aaa = showHello4(name:"홍길동");print(aaa)
print(showHello4(name:"홍길동"))


print("\n")






print("------  함수 설명 (입력 파라미터가 복수인 경우)-----")
func calcBMI(name:String, height:Double, weight:Double){
    let heightM  = height / 100.0
    let BMI:Double = weight / (heightM * heightM)
    print("\(name)의 BMI는 \(BMI)입니다.")
}

calcBMI(name:"홍길동", height:176.0, weight:53.0)

print("\n")







//연습 다양한 데이터 출력
func testSum1 (name:String, a:Int, b:Double){
    print("name:\(name) int:\(a) double:\(b)")
}
testSum1(name: "신", a: 10, b: 10.5)

//연습2 평균구하기
var sum = 0
func testSum2 (a:Int, b:Int, c:Int) -> Int{
    sum = a+b+c
    var avg = sum/3
    return avg
}
var num = 100
var num2 = 200
var num3 = 300
var test = testSum2(a: num, b: num2, c: num3)
print("합계: \(sum) 평균: \(test)")
print(sum)



// 연습2-2 리턴 2개

func testSum3 (a:Int, b:Int, c:Int) -> (Int, Int){ //int 2개
    var sum2 = a+b+c
    var avg2 = sum2/3
    return (sum2, avg2) // () 감싸주고
}
var (sum2, avg2) = testSum3(a: num, b: num2, c: num3) //() 변수 만들기
print( "합계:\(sum2),평균:\(avg2)")



//연습3 함수 내에서 for 문 1-10까지 합
var resultFor = 0
func forLoop(a:Int, b:Int) -> Int {
    for i in a...b {
        resultFor = resultFor + i
    }
    return resultFor
}
var sumTest = forLoop(a:1, b:10)
print(sumTest)







//call by value, call by reference  찾아보고 이해하기


print("------  Swap 함수 -----")
// swap 함수 구현하기 call by value
func myswap(a:Int, b:Int)->(Int,Int){
    print("my swap function called")
    
    return (b,a)
}
var a=1
var b=2

(a,b) = myswap(a: a, b: b)
print("a=\(a), b=\(b)") // changed

// swap 함수 구현하기 call by reference
//swap(&a, &b) // https://developer.apple.com/documentation/swift/1540890-swap
//print("a=\(a), b=\(b)") // changed







print("\n")
print("------  재귀 함수 설명 (1~100합)-----")

func recursiveCall(n:Int)->Int{
    //print("recursiveCall received \(n)")
    if ( n == 0){
        return 0
    }else if ( n >= 100 ){
        return 100
    }else{
        return n + recursiveCall(n: n+1) //리턴 못하고 기다림. 메모리 따로 관리됨. 100이 되면 리턴못했던 n이 역으로 쭉 더해서 5050 이 나오는것
    }
}

var recursiveResult = recursiveCall(n:1)
print(recursiveResult)



//문제 재귀이용
//1.  5!   5*4*3*2*1

func factorial(n:Int)->Int{
    if (n==1) {
        return 1
    }
    else{
        return n * factorial(n: n-1)
    }
}

factorial(n: 5)



//2. 100 - 200까지의 합

func sumRecur (n1:Int) -> Int{
    if ( n1 == 0) {
        return 0
    } else if ( n1 >= 200){
        return 200
    }else{
        return n1 + sumRecur(n1: n1+1)
    }
}
var sumResult = sumRecur(n1:100)
print(sumResult)





//피보나치 수열
//백준 하노이탑 재귀함수 이용 함 풀어보기..

//func fibo(n:Int)->Int{
//    if (n == 0) {
//        return 0
//    }else if(n == 1){
//        return 1
//    }else
//    return fibo(n:n-1)  + fibo(n: n-2)
//}
//fiboResult= fibo(n: <#T##Int#>)








print("\n")
print("------  클래스 -----")
//클래스를 만들었다! 재활용 가능
//인간 클래스에  머리, 팔, 다리 등등 객체
// 하나님이 클래스, 예수 객체. 예수 통해서 클래스에 접근 가능.
// self 는 자기자신 , super 는 부모
class Car  {
    
    var number:String
    var Color:String
    var maxSpeed:Int
    var type:String
    var distance:Double
    var fuelGauge:Double
    
    init() { //생성자 함수. 객체 생성 되면서 초기화. 약속된 함수임.
        self.number = "0000"
        self.Color = "white"
        self.maxSpeed = 300
        self.type = "SUV"
        self.fuelGauge = 0
        self.distance = 0
    }
    
    func increaseDistance(dist:Double){
        self.distance += dist
    }
    
    func putFuel(fuel:Double){
        self.fuelGauge += fuel
    }
    
    func getFuelEfficiency() -> Double{
        return distance / fuelGauge
    }
}

 let myCar = Car() // mycar는 car() 클래스에 접근할 수 있는 객체! car () 클래스를 불러올때, init() 함수를 초기화하는것.
 myCar.increaseDistance(dist: 100)
 myCar.putFuel(fuel: 10)

print("\(myCar.getFuelEfficiency()) Km/l") //myCar.getFuelEfficiency() 통해 리턴받은 값을 메모리상으로 바로 값을 찍어줌. (변수 통해 리턴받아서 찍을 수도있지만)





print("\n")
print("------  클래스 상속 -----")
// 부모 와 자식.  자식에게 부모 클래스를 상속받았어!
// 오버로드와  오버라이드   오버라이드란 자식이 부모 속성 함수등 물려받았는데, 자식이 재정립 하는것을 오버라이드라 함.

class Santafe : Car{ //위에 car 상속 받겠다
    
    override init() { // override init 재정의 하겠다!.
        super.init() // super는 부모것을 상속받고
        self.Color = "Black" //color만 재정립 하겠다
    }
    
    override func putFuel(fuel: Double) { //putfuel 자식이 재정립했다! 재정립하니 putFuel을 잡음
        self.fuelGauge = (self.fuelGauge + fuel) * 0.8  //이미 부모 클래스 함수가 눈에 안보이지만 들어와 있음
    }
}

let mySantafe = Santafe()
mySantafe.increaseDistance(dist: 100)
mySantafe.putFuel(fuel: 10) // 위에 재정립한 override putFuel 로 감.
print("\(mySantafe.getFuelEfficiency()) Km/l")







// 본인의 car를 만들어보기 . 연비말고도.
print("\n")
print("------  클래스 상속 실습 -----")

class superSin : Car{
    override init() {
        super.init()
        self.distance = 5

    }
    override func increaseDistance(dist:Double){
        self.distance += dist * 1.2
    }
}
let mySuper = superSin()
mySuper.increaseDistance(dist: 100)
mySuper.putFuel(fuel: 10)
print("\(mySuper.getFuelEfficiency()) km/l")


