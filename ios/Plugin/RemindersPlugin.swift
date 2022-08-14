import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(RemindersPlugin)
public class RemindersPlugin: CAPPlugin {
    private let implementation = Reminders()
    
    @objc override public func requestPermissions(_ call: CAPPluginCall) {
        if (!ReminderStore.shared.isAvailable) {
            do {
                try ReminderStore.shared.requestAccess() {
                    DispatchQueue.main.async {
                        call.resolve(["permission":ReminderStore.shared.authorizationStatus])
                    }
                }
            }
            catch {
                call.reject(error.localizedDescription)
            }
        }
        else {
            call.resolve(["permission":ReminderStore.shared.authorizationStatus])
        }
    }
    
    @objc override public func checkPermissions(_ call: CAPPluginCall) {
        call.resolve(["permission":ReminderStore.shared.authorizationStatus])
    }
    
    
    @objc func readAll(_ call: CAPPluginCall) {
        if #available(iOS 13.0, *) {
            Task {
                do {
                    let reminders = try await ReminderStore.shared.readAll()
                    
                    var result = [:] as [String:Any]
                    result["reminders"] = reminders.map { $0.serialize() }
                    call.resolve(result)
                }
                catch {
                    call.reject(error.localizedDescription)
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    @objc func write(_ call: CAPPluginCall) {
        do {
            let reminder = try Reminder(with: call.getObject("reminder")!)
            try ReminderStore.shared.save(reminder)
            call.resolve()
        }
        catch {
            call.reject(error.localizedDescription)
        }
    }
    
    @objc func delete(_ call: CAPPluginCall) {
        do {
            try ReminderStore.shared.remove(with: call.getString("id")!)
            call.resolve()
        }
        catch {
            call.reject(error.localizedDescription)
        }
    }
}
