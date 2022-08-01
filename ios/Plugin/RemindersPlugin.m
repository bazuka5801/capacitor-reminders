#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(RemindersPlugin, "Reminders",
           CAP_PLUGIN_METHOD(requestPermissions, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(checkPermissions, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(readAll, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(write, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(delete, CAPPluginReturnPromise);
)
