//Shawn Xiang

import Foundation

public extension Float {
    
    func abs () -> Float {
        return Foundation.fabs(self)
    }
    
    func sqrt () -> Float {
        return Foundation.sqrt(self)
    }
    
    func floor () -> Float {
        return Foundation.floor(self)
    }
    
    func ceil () -> Float {
        return Foundation.ceil(self)
    }
    
    func round () -> Float {
        return Foundation.round(self)
    }
    
    func floorToInt() -> Int {
        return Int(self.floor())
    }
    
    func ceilToInt() -> Int {
        return Int(self.ceil())
    }
    
    func roundToInt() -> Int {
        return Int(self.round())
    }
    
    func floorToString() -> String {
        return String(self.floor())
    }
    
    func ceilToString() -> String {
        return String(self.ceil())
    }
    
    func roundToString() ->String {
        return String(self.round())
    }
    
    func toPercentage() -> Float {
        return self*100
    }
    
    func toDecimal() -> Float {
        return self/100
    }
    
    func isPositive() -> Bool {
        return self > 0
    }
    
    func isNegative() -> Bool {
        return self < 0
    }
    
    func isZero() -> Bool {
        return self == 0
    }
    
    func sign() -> String {
        return self >= 0 ? " " : "-"
    }
    
    func fullSign() -> String {
        if (isPositive()){
            return "+"
        }
        else if (isNegative()){
            return "-"
        }
        else {
            return " "
        }
        
    }
    
    
}
