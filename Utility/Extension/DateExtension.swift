//
//  DateExtension.swift
//  Utility
//
//  Created by Zhang, Wanming on 2/9/22.
//

import Foundation

extension Date {
    
    var millisecondsSince1970:Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    func currentTimeInMilliseconds() -> Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    func millisecondsSince(date: Date) -> Int64 {
        return Int64((date.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    
    func yearsAgo(_ numOfYears: Int) -> Date? {
        return Calendar.current.date(byAdding: .year, value: -numOfYears, to: self)
    }
    
    func monthsAgo(_ numOfMonths: Int) -> Date? {
        return Calendar.current.date(byAdding: .month, value: -numOfMonths, to: self)
    }
    
    func daysAgo(_ numOfDays: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: -numOfDays, to: self)
    }
}
