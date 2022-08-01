//
//  EKReminder+Reminder.swift
//  Plugin
//
//  Created by Maxim on 31.07.2022.
//  Copyright © 2022 Max Lynch. All rights reserved.
//

import Foundation
import EventKit

extension EKReminder {
    func update(using reminder: Reminder, in store: EKEventStore) {
        title = reminder.title
        notes = reminder.notes
        isCompleted = reminder.isComplete
        completionDate = reminder.completionDate
        calendar = store.defaultCalendarForNewReminders()
        if (reminder.dueDate != nil) {
            alarms?.forEach { alarm in
                guard let absoluteDate = alarm.absoluteDate else { return }
                let comparison = Locale.current.calendar.compare(reminder.dueDate!, to: absoluteDate, toGranularity: .minute)
                if comparison != .orderedSame {
                    removeAlarm(alarm)
                }
            }
            if !hasAlarms {
                addAlarm(EKAlarm(absoluteDate: reminder.dueDate!))
            }
        }
    }
}
