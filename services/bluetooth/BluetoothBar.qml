pragma Singleton

import Quickshell
import Quickshell.Bluetooth

Singleton {
    property var adapter: Bluetooth.defaultAdapter
    property bool enabled: adapter.enabled
    property bool discovering: adapter.discovering
    property var devices: Bluetooth.devices
    function devicesConnected() {
        return devices.values.filter(d => d.connected)
    }
    property var connected: devicesConnected()
    property bool anyConnected: connected.length > 0

    property string icon: !enabled ? "󰂲" : (discovering ? "󰂰" : (anyConnected ? "󰂱" : "󰂯" ))
}
