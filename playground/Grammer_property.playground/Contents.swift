import UIKit

struct Student {
    var name: String
    var age: Int
}

var atlas = Student(name: "아틀라스", age: 20)
print(atlas)


/**
 연산 프로퍼티
 실제값을 저장하고 있는 것이 아니라 set/get 으로 값을 탐색하고
 간접적으로 다른 프로퍼티의 값을 설정할 수 있다.
 */

struct WeeklySalary {
    var hourlyWage: Double
    var workingHours: Double
    
    var wage: Double {
        get {
            return hourlyWage * workingHours
        }
        set {
            workingHours = newValue / hourlyWage
        }
    }
}

var myWeeklySalary = WeeklySalary(hourlyWage: 10000, workingHours: 4)
print(myWeeklySalary)
print(myWeeklySalary.wage)
myWeeklySalary.wage = 50000
print(myWeeklySalary.workingHours)

/**
 프로퍼티 옵저버
 프로퍼티의 새 값이 설정 될 때마다 이벤트를 감지할 수 있다.
 willSet / didSet
 */
struct Student2 {
    var name: String {
        willSet {
            print("\(name) -> \(newValue)로 변경 예정")
        }
        didSet {
            print("\(oldValue) -> \(name)로 변경됨")
        }
    }
}

var atlasw = Student2(name: "아틀라스")
atlasw.name = "atlas"


/**
 타입 프로퍼티
 static을 이용해 선언 가능
 인스턴스 생성을 하지 않아도 사용 가능
 저장 프로퍼티, 연산 프로퍼티로 사용 가능
 */
struct SomeStruct {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 1
    }
}

print(SomeStruct.storedTypeProperty)
print("\(SomeStruct.computedTypeProperty)")


