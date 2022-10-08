//
//  Reminder+Capacitor.swift
//  Plugin
//
//  Created by Maxim on 31.07.2022.
//  Copyright © 2022 Max Lynch. All rights reserved.
//

import Foundation
import Capacitor
import EventKit

extension EKRecurrenceFrequency : CustomStringConvertible {
    public var description: String {
        switch self {
            case .daily : return "daily"
            case .weekly : return "weekly"
            case .monthly : return "monthly"
            case .yearly : return "yearly"
        }
    }
}
extension EKWeekday : CustomStringConvertible {
    public var description: String {
        switch self {
            case .sunday : return "sunday"
            case .monday : return "monday"
            case .tuesday : return "tuesday"
            case .wednesday : return "wednesday"
            case .thursday : return "thursday"
            case .friday : return "friday"
            case .saturday : return "saturday"
        }
    }
}

extension Reminder {
    func serialize() -> NSDictionary {
        return [
            "id": id,
            "title": title,
            "dueDate": dueDate ?? "",
            "notes": notes ?? "",
            "isComplete": isComplete,
            "completionDate": completionDate ?? "",
            "hasRecurrenceRules": hasRecurrenceRules,
            "lastModifiedDate": lastModifiedDate ?? "",
            "recurrenceRules": recurrenceRules != nil ? recurrenceRules?.compactMap { rule in
                return [
                    "frequency": "\(rule.frequency)",
                    "interval": rule.interval,
                    "dateEnd": rule.recurrenceEnd?.endDate ?? "",
                    "daysOfTheWeek": rule.daysOfTheWeek != nil ? rule.daysOfTheWeek!.compactMap({ dayOfWeek in
                        return [
                            "dayOfTheWeek": "\(dayOfWeek.dayOfTheWeek)",
                            "weekNumber": dayOfWeek.weekNumber,
                        ]
                    }) : "",
                    "daysOfTheMonth": rule.daysOfTheMonth ?? "",
                    "daysOfTheYear": rule.daysOfTheYear ?? "",
                    "weeksOfTheYear": rule.weeksOfTheYear ?? "",
                    "monthsOfTheYear": rule.monthsOfTheYear ?? ""
                ]
            }  : ""
            
        ]
    }
    
    
    init(with obj: JSObject) throws {
        let isoDate = obj["dueDate"]
        let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        if (obj["dueDate"] == nil) {
            dueDate = nil
        }
        else if let date = dateFormatter.date(from: isoDate as! String) {
            dueDate = date
        }
        
        
        id = obj["id"] as! String
        title = obj["title"] as! String
        
        notes = obj["notes"] as? String
        isComplete = (obj["isCompleted"] != nil)
        if (obj["completionDate"] == nil) {
            completionDate = nil
        }
        else if let date = dateFormatter.date(from: obj["completionDate"] as! String) {
            completionDate = date
        }
    }
}
