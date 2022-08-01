//
//  Reminder.swift
//  Plugin
//
//  Created by Maxim on 31.07.2022.
//  Copyright © 2022 Max Lynch. All rights reserved.
//

import Foundation

struct Reminder: Equatable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var dueDate: Date?
    var notes: String? = nil
    var isComplete: Bool = false
    var completionDate: Date?
}

extension Array where Element == Reminder {
    func indexOfReminder(with id: Reminder.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}
