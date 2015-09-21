//Shawn Xiang

import Foundation

public extension Int {
    
    func toString() -> String{
        return String(self)
    }
    
    func toDouble() -> Double{
        return Double(self)
    }
    
    func toFloat() -> Float {
        return Float(self)
    }
    
    func isEven () -> Bool {
        return (self % 2) == 0
    }
    
    func isOdd () -> Bool {
        return !isEven()
    }
    
    func abs () -> Int {
        return Swift.abs(self)
    }
    
    func gcd (n: Int) -> Int {
        return n == 0 ? self : n.gcd(self % n)
    }
    
    func lcm (n: Int) -> Int {
        return (self * n).abs() / gcd(n)
    }
    
    func factorial () -> Int {
        return self == 0 ? 1 : self * (self - 1).factorial()
    }
    
    func isZero() -> Bool {
        return self == 0
    }
    
    func isPositive() -> Bool {
        return self > 0
    }
    
    func isNegative() -> Bool {
        return self < 0
    }
    
    func sign() -> String{
        return isNegative() ? "-" : " "
    }
    
    func fullSign() -> String{
        if (isPositive()){
            return "+"
        } else if (isNegative()){
            return "-"
        } else {
            return " "
        }
    }
    
    // Similar to the Ruby equivalent. You can do 5.times { print("hello world")} and it will print it five times
    func times(task: () -> ()) {
        for _ in 1 ... self  {
            task()
        }
    }

}

