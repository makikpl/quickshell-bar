import Quickshell
import QtQuick
import qs.services.battery
import qs.config
import qs.config.colors

Text {
    text: BatteryBar.percentage + "% " + BatteryBar.icon
    color: MatugenColors.textColor
    font {
        family: Settings.fontFamily
        weight: Settings.fontWeight
        pixelSize: Settings.fontSize
    }
}
