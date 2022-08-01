import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(RemindersPlugin)
public class RemindersPlugin: CAPPlugin {
    private let implementation = Reminders()
    
    @available(iOS 13.0.0, *)
    @objc func requestPermissions(_ call: CAPPluginCall) async {
        if (!ReminderStore.shared.isAvailable) {
            do {
                try await ReminderStore.shared.requestAccess()
                call.resolve()
            }
            catch {
                call.reject(error.localizedDescription)
            }
        }
        else {
            call.resolve()
        }
    }
    
    @objc override public func checkPermissions(_ call: CAPPluginCall) {
        call.resolve(["permission":ReminderStore.shared.authorizationStatus])
    }
    
    
    @available(iOS 13.0.0, *)
    @objc func readAll(_ call: CAPPluginCall) async {
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
