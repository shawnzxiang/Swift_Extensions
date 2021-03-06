// Shawn Xiang

import Foundation

extension String {
    subscript(integerIndex: Int) -> Character {
        let index = startIndex.advancedBy(integerIndex)
        return self[index]
    }
    
    subscript(integerRange: Range<Int>) -> String {
        let start = startIndex.advancedBy(integerRange.startIndex)
        let end = startIndex.advancedBy(integerRange.endIndex)
        let range = start..<end
        return self[range]
    }
    
    func contains(find: String) -> Bool{
        return self.rangeOfString(find) != nil
    }
    
    func remove(find: String) -> String {
        return (self.stringByReplacingOccurrencesOfString(find, withString:""))
        
    }
    
    func replace(from: String, to: String) -> String{
        return (self.stringByReplacingOccurrencesOfString(from, withString:to))
    }
    
    func split(delimiter: String) -> [String]{
        return (self.componentsSeparatedByString(delimiter))
    }
    
   
    func numberOfOccurance(find: String) -> Int{
        return (self.componentsSeparatedByCharactersInSet(NSCharacterSet (charactersInString:find)).count - 1)
        
    }
    
    func containsOne(find:String) -> Bool {
        return self.numberOfOccurance(".") == 1
    }
    
    func times(indexes: Int) -> String{
        var result = ""
        for _ in 1...indexes {
            result += self
        }
    
        return result
    }
    
    func toInt() -> Int{
        return isInt() ? Int(self)! : 0
    }
    
    func toDouble() -> Double {
        return isDouble() ? Double(self)! : 0.0
    }
    
    func toFloat() -> Float {
        return isDouble() ? Float(self)! : 0.0
    }
    
    func isInt() -> Bool {
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        
        for digit in self.unicodeScalars {
            if (!digits.longCharacterIsMember(digit.value)){
                return false
            }
        }
        
        return true
    }
    
    func isDouble() -> Bool{
        if (self.isInt()){
            return true
        } else if (self.containsOne(".")){
           return self.remove(".").isInt()
        }
        return false
    }
    
    func isPercentage() -> Bool{
        return self.containsOne("%")
    }
    
    func isLetter() -> Bool{
        return self.isCharSet(NSCharacterSet.letterCharacterSet())
    }
    
    func isAlphaNumeric() -> Bool{
        return self.isCharSet(NSCharacterSet.alphanumericCharacterSet())
    }
    
    func isCapitalizedLetters() -> Bool{
        return self.isCharSet(NSCharacterSet.capitalizedLetterCharacterSet())
    }
    
    func isCharSet(set: NSCharacterSet) -> Bool{
        let digits = set
        
        for digit in self.unicodeScalars {
            if (!digits.longCharacterIsMember(digit.value)){
                return false
            }
        }
        
        return true
    }
    
    
    
}
