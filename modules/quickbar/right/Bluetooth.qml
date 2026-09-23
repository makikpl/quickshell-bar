import Quickshell
import QtQuick
import qs.services.bluetooth
import qs.config
import qs.config.colors

Text {
    text: BluetoothBar.icon
    color: MatugenColors.textColor
    font {
        family: Settings.fontFamily
        weight: Settings.fontWeight
        pixelSize: Settings.fontSize
    }
}
