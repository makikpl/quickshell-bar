import Quickshell
import QtQuick
import qs.services.weather
import qs.config
import qs.config.colors

Text {
    text: WeatherCurrent.temp + (Settings.imperialUnits ? "F°" : "C°") + " " + WeatherCurrent.icon
    color: MatugenColors.textColor
    font {
        family: Settings.fontFamily
        weight: Settings.fontWeight
        pixelSize: Settings.fontSize
    }
}
