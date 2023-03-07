//import UIKit
//import PlaygroundSupport
//@testable import Khaier_App
//
////PlaygroundPage.current.liveView = LoginViewController()
//
//func incr(_ num: Int) -> Int {
//    return num + 1
//}
//
//func stringify(_ num: Int) -> String {
//    return "String value \(num)"
//}
//
//func apend( _ str: String) -> [Character] {
//    var arr: [Character] = []
//    str.forEach({arr.append($0)})
//    return arr
//}
//
//
//var a = apend(stringify(incr(5))).count
//
//a * a
//
//
//
//
//
//
//precedencegroup Inject {
//    associativity: left
//}
//
//precedencegroup Forward {
//    associativity: left
//    higherThan: Inject
//}
//
//infix operator |>: Inject
//
//infix operator >>>: Forward
//
//func >>> <A,B,C>(_ f:@escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> (C) {
//    return { a in
//        g(f(a))
//    }
//}
//
//func |> <A,B>(_ value: A, _ f: @escaping (A) -> B ) -> B {
//    return f(value)
//}
//
//let stringifiedIncr = 5 |> incr >>> stringify >>> apend >>> {$0.count} >>> {$0 * $0} >>> {($0 - 10) / 2 } >>> String.init
////
//stringifiedIncr(5)
////enum sums {
////    case num(Nums)
////    case bool(Bool)
////}
////
////sums.num(.one)
////sums.num(.one)
////sums.num(.one)
////sums.bool(true)
////sums.bool(false)
////
////
////struct prod {
////    let num: Nums
////    let bool: Bool
////}
////
////prod(num: .one, bool: false)
////prod(num: .two, bool: false)
////prod(num: .three, bool: false)
////prod(num: .one, bool: true)
////prod(num: .two, bool: true)
////prod(num: .three, bool: true)
