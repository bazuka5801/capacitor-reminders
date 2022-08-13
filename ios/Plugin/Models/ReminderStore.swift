//
//  ReminderStore.swift
//  Plugin
//
//  Created by Maxim on 31.07.2022.
//  Copyright © 2022 Max Lynch. All rights reserved.
//

import Foundation
import EventKit

extension EKAuthorizationStatus : CustomStringConvertible {
    public var description: String {
        switch self {
            case .notDetermined : return "notDetermined"
            case .restricted : return "restricted"
            case .denied : return "denied"
            case .authorized : return "authorized"
        }
    }
}

class ReminderStore {
    static let shared = ReminderStore()
    
    private let ekStore = EKEventStore()
    
    var isAvailable: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .authorized
    }
    
    var authorizationStatus: String {
        "\(EKEventStore.authorizationStatus(for: .reminder))"
    }
    
    func requestAccess() throws {
        if #available(iOS 13.0, *) {
            Task {
                let status = EKEventStore.authorizationStatus(for: .reminder)
                
                switch status {
                case .authorized:
                    return
                case .restricted:
                    throw ReminderError.accessRestricted
                case .notDetermined:
                    let accessGranted = try await ekStore.requestAccess(to: .reminder)
                    guard accessGranted else {
                        throw ReminderError.accessDenied
                    }
                case .denied:
                    throw ReminderError.accessDenied
                @unknown default:
                    throw ReminderError.unknown
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    private func read(with id: Reminder.ID) throws -> EKReminder {
        guard let ekReminder = ekStore.calendarItem(withIdentifier: id) as? EKReminder else {
            throw ReminderError.failedReadingCalendarItem
        }
        return ekReminder
    }
    
    @available(iOS 13, *)
    func readAll() async throws -> [Reminder] {
        guard isAvailable else {
            throw ReminderError.accessDenied
        }
        
        let predicate = ekStore.predicateForReminders(in: nil)
        let ekReminders = try await ekStore.fetchReminders(matching: predicate)
        let reminders: [Reminder] = try ekReminders.compactMap { ekReminder in
            do {
                return try Reminder(with: ekReminder)
            } catch ReminderError.reminderHasNoDueDate {
                return nil
            }
        }
        return reminders
    }
    
    func remove(with id: Reminder.ID) throws {
        guard isAvailable else {
            throw ReminderError.accessDenied
        }
        let ekReminder = try read(with: id)
        try ekStore.remove(ekReminder, commit: true)
    }
    
    @discardableResult
    func save(_ reminder: Reminder) throws -> Reminder.ID {
        guard isAvailable else {
            throw ReminderError.accessDenied
        }
        let ekReminder: EKReminder
        do {
            ekReminder = try read(with: reminder.id)
        } catch {
            ekReminder = EKReminder(eventStore: ekStore)
        }
        ekReminder.update(using: reminder, in: ekStore)
        try ekStore.save(ekReminder, commit: true)
        return ekReminder.calendarItemIdentifier
    }
}

