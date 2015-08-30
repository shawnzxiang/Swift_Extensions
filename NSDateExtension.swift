//
//  NSDateExtension.swift
//
//  Created by Shawn Xiang on 8/29/15.
//  Copyright © 2015 Shawn Xiang. All rights reserved.
//

/*
Time formatting reference
yyyy MM    dd  hh   mm     ss
YEAR MONTH DAY HOUR MINUTE SECOND
*/

import Foundation

extension NSDate
{
    
    // MARK: Takes in any date string and formatting and initialize as a date
    convenience
    init(dateString:String, dateFormatString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = dateFormatString
        let d = dateStringFormatter.dateFromString(dateString)!
        self.init(timeInterval:0, sinceDate:d)
    }
    
    // MARK: Takes in any year, month, day, hour, min and sec and initialize it as a NSDate
    convenience init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int){
        let dateStringFormatter = NSDateFormatter()
        var dateFormatString: String = ""
        var dateInputString: String = ""
        
        if (year < 100){
            dateFormatString += "yy"
            dateInputString += String(year)
        } else {
            dateFormatString += "yyyy"
            dateInputString += String(year)
        }
        
        dateFormatString += "MMddHHmmss"
        
        if (month > 10){
            dateInputString += String(month)
        } else {
            dateInputString += "0" + String(month)
        }
        
        if (day > 10){
            dateInputString += String(day)
        } else {
            dateInputString += "0" + String(day)
        }
        
        if (hour > 9){
            dateInputString += String(hour)
        } else {
            dateInputString += "0" + String(hour)
        }
        
        if (minute > 9){
            dateInputString += String(minute)
        } else {
            dateInputString += "0" + String(minute)
        }
        
        if (second > 9){
            dateInputString += String(second)
        } else {
            dateInputString += "0" + String(second)
        }
        
        dateStringFormatter.dateFormat = dateFormatString
        let result = dateStringFormatter.dateFromString(dateInputString)!
        self.init(timeInterval:0, sinceDate:result)
        
    }
    
    // MARK: Takes in any arbitrary year, month, day to a NSDate
    convenience init(year: Int, month: Int, day: Int){
        let dateStringFormatter = NSDateFormatter()
        var dateFormatString: String = ""
        var dateInputString: String = ""
        
        if (year < 100){
            dateFormatString += "yy"
            dateInputString += String(year)
        } else {
            dateFormatString += "yyyy"
            dateInputString += String(year)
        }
        
        dateFormatString += "MMdd"
        
        if (month > 9){
            dateInputString += String(month)
        } else {
            dateInputString += "0" + String(month)
        }
        
        if (day > 9){
            dateInputString += String(day)
        } else {
            dateInputString += "0" + String(day)
        }
        
        dateStringFormatter.dateFormat = dateFormatString
        let d = dateStringFormatter.dateFromString(dateInputString)!
        self.init(timeInterval:0, sinceDate:d)
        
    }
    
    // Mark: Similar to the init function above but returns NSDate
    func setNSDate(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> NSDate{
        let dateStringFormatter = NSDateFormatter()
        var dateFormatString: String = ""
        var dateInputString: String = ""
        
        if (year < 100){
            dateFormatString += "yy"
            dateInputString += String(year)
        } else {
            dateFormatString += "yyyy"
            dateInputString += String(year)
        }
        
        dateFormatString += "MMddHHmmss"
        
        if (month > 9){
            dateInputString += String(month)
        } else {
            dateInputString += "0" + String(month)
        }
        
        if (day > 9){
            dateInputString += String(day)
        } else {
            dateInputString += "0" + String(day)
        }
        
        if (hour > 9){
            dateInputString += String(hour)
        } else {
            dateInputString += "0" + String(hour)
        }
        
        if (minute > 9){
            dateInputString += String(minute)
        } else {
            dateInputString += "0" + String(minute)
        }
        
        if (second > 9){
            dateInputString += String(second)
        } else {
            dateInputString += "0" + String(second)
        }
        
        dateStringFormatter.dateFormat = dateFormatString
        let result = dateStringFormatter.dateFromString(dateInputString)!
        
        return result
    }
    
    // MARK: set time periods
    
    func setYear() -> NSDate{
        var year = self.getYearInInt()
        
        var date = setNSDate(year, month: self.getMonthInInt(), day: self.getDayInInt(), hour: self.getHourInInt(), minute: self.getMinInInt(), second: self.getSecInInt())
        return date
    }
    
    func setMonth() -> NSDate{
        var month = self.getYearInInt()
        
        var date = setNSDate(self.getYearInInt(), month: month, day: self.getDayInInt(), hour: self.getHourInInt(), minute: self.getMinInInt(), second: self.getSecInInt())
        return date
    }
    
    func setDay() -> NSDate{
        var day = self.getDayInInt()
        var date = setNSDate(self.getYearInInt(), month: self.getMonthInInt(), day: day, hour: self.getHourInInt(), minute: self.getMinInInt(), second: self.getSecInInt())
        return date
    }
    
    func setHour() -> NSDate{
        var hour = self.getHourInInt()
        var date = setNSDate(self.getYearInInt(), month: self.getMonthInInt(), day: self.getDayInInt(), hour: hour, minute: self.getMinInInt(), second: self.getSecInInt())
        return date
    }
    
    func setMin() -> NSDate {
        var min = self.getMinInInt()
        var date = setNSDate(self.getYearInInt(), month: self.getMonthInInt(), day: self.getDayInInt(), hour: self.getHourInInt(), minute: min, second: self.getSecInInt())
        return date
    }
    
    func setSec() -> NSDate{
        var sec = self.getSecInInt()
        var date = setNSDate(self.getYearInInt(), month: self.getMonthInInt(), day: self.getDayInInt(), hour: self.getHourInInt(), minute: sec, second: self.getSecInInt())
        return date
    }
    
    // MARK: set tomorrow and yesterday
    func tomorrow() -> NSDate{
        return self.addHours(24)
    }
    
    func yesterday() ->NSDate{
        return self.addHours(-24)
    }
    
    // MARK: compare NSDate based on date and time
    func isGreaterThanDateAndTime(dateToCompare : NSDate) -> Bool
    {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedDescending
        {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    
    func isLessThanDateAndTime(dateToCompare : NSDate) -> Bool
    {
        var isLess = false
        
        if self.compare(dateToCompare) == NSComparisonResult.OrderedAscending
        {
            isLess = true
        }
        
        return isLess
    }
    
    
    func isEqualToTheDateAndTime(dateToCompare : NSDate) -> Bool
    {
        var isEqualTo = false
        
        if self.compare(dateToCompare) == NSComparisonResult.OrderedSame
        {
            isEqualTo = true
        }
        
        return isEqualTo
    }
    
    // MARK: get time period in string with self or another NSDate
    func getYearInString() -> String{
        return convertToString("yyyy")
    }
    
    func getMonthInString() -> String {
        return convertToString("MM")
    }
    
    func getDayInString() -> String {
        return convertToString("dd")
    }
    
    func getHourInString() -> String {
        return convertToString("hh")
    }
    
    func getMinInString() -> String {
        return convertToString("mm")
    }
    
    
    func getSecInString() -> String {
        return convertToString("ss")
    }
    
    func getYearInString(value: NSDate) -> String{
        return convertToString(value, formatString: "yyyy")
    }
    
    func getMonthInString(value: NSDate) -> String {
        return convertToString(value, formatString: "MM")
    }
    
    func getDayInString(value: NSDate) -> String {
        return convertToString(value, formatString: "dd")
    }
    
    func getHourInString(value: NSDate) -> String {
        return convertToString(value, formatString: "hh")
    }
    
    func getMinInString(value: NSDate) -> String {
        return convertToString(value, formatString: "mm")
    }
    
    func getSecInString(value: NSDate) -> String {
        return convertToString(value, formatString: "ss")
    }
    
    
    
    // MARK: get Time period in integer
    func getYearInInt() -> Int{
        return (Int(getYearInString()))!
    }
    
    func getMonthInInt() -> Int{
        return (Int(getMonthInString()))!
    }
    
    func getDayInInt() -> Int{
        return (Int(getDayInString()))!
    }
    
    func getHourInInt() -> Int{
        return (Int(getHourInString()))!
    }
    
    func getMinInInt() -> Int{
        return (Int(getMinInString()))!
    }
    
    func getSecInInt() -> Int{
        return (Int(getSecInString()))!
    }
    
    
    func getYearInInt(value: NSDate) -> Int{
        return (Int(getYearInString(value)))!
    }
    
    func getMonthInInt(value: NSDate) -> Int{
        return (Int(getMonthInString(value)))!
    }
    
    func getDayInInt(value: NSDate) -> Int{
        return (Int(getDayInString(value)))!
    }
    
    func getHourInInt(value: NSDate) -> Int{
        return (Int(getHourInString(value)))!
    }
    
    func getMinInInt(value: NSDate) -> Int{
        return (Int(getMinInString(value)))!
    }
    
    func getSecInInt(value: NSDate) -> Int{
        return (Int(getSecInString(value)))!
    }
    
    
    func isGreaterInDateOnly(secondDate: NSDate) -> Bool{
        if (getYearInInt(self) > getYearInInt(secondDate)){
            return true
        } else if (getMonthInInt(self) > getMonthInInt(secondDate)){
            return true
        } else if (getDayInInt(self) > getDayInInt(secondDate)){
            return true
        } else {
            return false
        }
    }
    
    func isSmallerInDateOnly(secondDate: NSDate) -> Bool{
        if (getYearInInt(self) < getYearInInt(secondDate)){
            return true
        } else if (getMonthInInt(self) < getMonthInInt(secondDate)){
            return true
        } else if (getDayInInt(self) < getDayInInt(secondDate)){
            return true
        } else {
            return false
        }
        
    }
    
    func isEqualToTheDateOnly(secondDate: NSDate) -> Bool{
        var firstDateString = getDayInString(self) + getMonthInString(self) + getYearInString(self)
        var secondDateString = getDayInString(secondDate) + getMonthInString(secondDate) + getYearInString(secondDate)
        
        if (firstDateString == secondDateString){
            return true
        } else {
            return false
        }
        
    }
    
    func convertToString(formatString: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = formatString
        
        return dateFormatter.stringFromDate(self)
    }
    
    func convertToString(date: NSDate, formatString: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = formatString
        
        
        
        return dateFormatter.stringFromDate(date)
   
    }
    
    // MARK: compare with tomorrow and yesterday
    func isItTomorrow(date: NSDate) -> Bool{
        return (isEqualToTheDateOnly(NSDate().addDays(1)))
    }
    
    func isItYesterday(date: NSDate) -> Bool{
        return (isEqualToTheDateOnly(NSDate().addDays(-1)))
    }
    
    // MARK: add or subtract time period
    func addDays(daysToAdd : Int) -> NSDate
    {
        var secondsInDays : NSTimeInterval = Double(daysToAdd) * 60 * 60 * 24
        var dateWithDaysAdded : NSDate = self.dateByAddingTimeInterval(secondsInDays)
        
        //Return Result
        return dateWithDaysAdded
    }
    
    
    func addHours(hoursToAdd : Int) -> NSDate
    {
        var secondsInHours : NSTimeInterval = Double(hoursToAdd) * 60 * 60
        var dateWithHoursAdded : NSDate = self.dateByAddingTimeInterval(secondsInHours)
        
        return dateWithHoursAdded
    }
    
    func addMins(minsToAdd: Int) -> NSDate
    {
        var secondsInMins : NSTimeInterval = Double(minsToAdd) * 60
        var dateWithMinsAdded : NSDate = self.dateByAddingTimeInterval(secondsInMins)
        
        return dateWithMinsAdded
    }
    
    func addSecs(secsToAdd: Int) -> NSDate
    {
        var secondsInMins : NSTimeInterval = 60
        var dateWithSecsAdded : NSDate = self.dateByAddingTimeInterval(secondsInMins)
        
        return dateWithSecsAdded
    }
    
    // MARK: convert datestamp to NSDate
    func convertUnixDatestampToNSDate(unixDate: String) -> NSDate{
        let prefix = "/Date("
        let suffix = ")/"
        let scanner = NSScanner(string: unixDate)
        
        // Check prefix:
        if scanner.scanString(prefix, intoString: nil) {
            
            // Read milliseconds part:
            var milliseconds : Int64 = 0
            if scanner.scanLongLong(&milliseconds) {
                // Milliseconds to seconds:
                var timeStamp = NSTimeInterval(milliseconds)/1000.0
                
                // Read optional timezone part:
                var timeZoneOffset : Int = 0
                if scanner.scanInteger(&timeZoneOffset) {
                    let hours = timeZoneOffset / 100
                    let minutes = timeZoneOffset % 100
                    // Adjust timestamp according to timezone:
                    timeStamp += NSTimeInterval(3600 * hours + 60 * minutes)
                }
                
                // Check suffix:
                if scanner.scanString(suffix, intoString: nil) {
                    // Success! Create NSDate and return.
                    
                    return NSDate(timeIntervalSinceReferenceDate: timeStamp)
                    
                    let prefix = "/Date("
                    let suffix = ")/"
                    let scanner = NSScanner(string: unixDate)
                    
                    // Check prefix:
                    if scanner.scanString(prefix, intoString: nil) {
                        
                        // Read milliseconds part:
                        var milliseconds : Int64 = 0
                        if scanner.scanLongLong(&milliseconds) {
                            // Milliseconds to seconds:
                            var timeStamp = NSTimeInterval(milliseconds)/1000.0
                            
                            // Read optional timezone part:
                            var timeZoneOffset : Int = 0
                            if scanner.scanInteger(&timeZoneOffset) {
                                let hours = timeZoneOffset / 100
                                let minutes = timeZoneOffset % 100
                                // Adjust timestamp according to timezone:
                                timeStamp += NSTimeInterval(3600 * hours + 60 * minutes)
                            }
                            
                            // Check suffix:
                            if scanner.scanString(suffix, intoString: nil) {
                                // Success! Create NSDate and return.
                                return NSDate(timeIntervalSinceReferenceDate: timeStamp)
                            }
                        }
                    }
                    
                    
                }
            
                }
            
        }
        
        return NSDate()
    }
}
