//
//  Reminder+EKReminder.swift
//  Plugin
//
//  Created by Maxim on 31.07.2022.
//  Copyright © 2022 Max Lynch. All rights reserved.
//

import Foundation
import EventKit

extension Reminder {
    init(with ekReminder: EKReminder) throws {
        guard let dueDate = ekReminder.alarms?.first?.absoluteDate else {
            throw ReminderError.reminderHasNoDueDate
        }
        id = ekReminder.calendarItemIdentifier
        title = ekReminder.title
        self.dueDate = dueDate
        notes = ekReminder.notes
        isComplete = ekReminder.isCompleted
        completionDate = ekReminder.completionDate
    }
}
