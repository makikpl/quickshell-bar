pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
    property var device: UPower.displayDevice
    property bool charging: UPower.onBattery
    property int percentage: Math.round(device.percentage * 100)
    function batteryDischarging(p) {
        if (p < 10) return "󱃍"
        else if (p >= 10 && p < 20) return "󰁺"
        else if (p >= 20 && p < 30) return "󰁻"
        else if (p >= 30 && p < 40) return "󰁼"
        else if (p >= 40 && p < 50) return "󰁽"
        else if (p >= 50 && p < 60) return "󰁾"
        else if (p >= 60 && p < 70) return "󰁿"
        else if (p >= 70 && p < 80) return "󰂀"
        else if (p >= 80 && p < 90) return "󰂁"
        else if (p >= 90 && p <= 95) return "󰂂"
        else if (p > 95) return "󰁹"
    }
    function batteryCharging(p) {
        if (p < 10) return "󰢟"
        else if (p >= 10 && p < 20) return "󰢜"
        else if (p >= 20 && p < 30) return "󰂆"
        else if (p >= 30 && p < 40) return "󰂇"
        else if (p >= 40 && p < 50) return "󰂈"
        else if (p >= 50 && p < 60) return "󰢝"
        else if (p >= 60 && p < 70) return "󰂉"
        else if (p >= 70 && p < 80) return "󰢞"
        else if (p >= 80 && p < 90) return "󰂊"
        else if (p >= 90 && p <= 95) return "󰂋"
        else if (p > 95) return "󰂅"
    }
    property string icon: !charging ? batteryCharging(percentage) : batteryDischarging(percentage)
}
