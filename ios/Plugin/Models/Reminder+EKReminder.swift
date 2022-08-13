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
        recurrenceRules = ekReminder.recurrenceRules ?? nil
        id = ekReminder.calendarItemIdentifier
        title = ekReminder.title
        dueDate = ekReminder.dueDateComponents?.date
        notes = ekReminder.notes
        isComplete = ekReminder.isCompleted
        completionDate = ekReminder.completionDate
        hasRecurrenceRules = ekReminder.hasRecurrenceRules
    }
}
