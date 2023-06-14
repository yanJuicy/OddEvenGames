import UIKit

var name: String = "Atlas"
var age: Int = 20

age = 30

/**
 상수 : 변하지 안흔 값
 let 상수명: 데이터 타입 = 값
 */
let one: Int = 1
let two: Int = 2

/**
 함수
 func 함수명 (파라미터 이름: 데이터 타입) -> 반환타입 {
    return 반환값
 }
 */
func sayHello(name: String) -> String {
    return "\(name)"
}

sayHello(name: "아틀라스")
