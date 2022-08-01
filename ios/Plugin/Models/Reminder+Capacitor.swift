//
//  Reminder+Capacitor.swift
//  Plugin
//
//  Created by Maxim on 31.07.2022.
//  Copyright © 2022 Max Lynch. All rights reserved.
//

import Foundation
import Capacitor

extension Reminder {
    func serialize() -> NSDictionary {
        return [
            "id": id,
            "title": title,
            "dueDate": dueDate ?? "",
            "notes": notes ?? "",
            "isComplete": isComplete,
            "completionDate": completionDate ?? ""
        ]
    }
    
    
    init(with obj: JSObject) throws {
        let isoDate = obj["dueDate"]
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
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
