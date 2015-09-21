// Shawn Xiang

import Foundation


public extension Double {
    
    func abs () -> Double {
        return Foundation.fabs(self)
    }
    
    func sqrt () -> Double {
        return Foundation.sqrt(self)
    }
    
    func floor () -> Double {
        return Foundation.floor(self)
    }
    
    func ceil () -> Double {
        return Foundation.ceil(self)
    }
    
    func round () -> Double {
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
    
    func toPercentage() -> Double {
        return self*100
    }
    
    func toDecimal() -> Double {
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
