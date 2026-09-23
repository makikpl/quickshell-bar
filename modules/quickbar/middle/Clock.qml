import QtQuick
import qs.services
import qs.config.colors
import qs.config

Text {
    text: Qt.formatDateTime(ClockService.date, "hh:mm")
    color: MatugenColors.textColor
    font {
        family: Settings.fontFamily
        weight: Settings.fontWeight
        pixelSize: Settings.fontSize
    }
}
