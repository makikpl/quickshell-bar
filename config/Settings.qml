pragma Singleton

import Quickshell
import QtQuick

Singleton {
    property string fontFamily: "FiraCode NerdFont"
    property int fontSize: 18
    property var fontWeight: Font.Medium
    property int borderWidth: 3
    property int roundness: 10
    property int barHeight: 40
    property int rModWidth: 600
    property int lModWidth: 500
    property int mModWidth: 200
    property bool imperialUnits: false
    // OpenWeather
    property string apiKey: "c90e3d65a43ae517bd1b7bbff1c4fd95"
    property string cityName: "Oleśnica"
    property string countryCode: "PL"
    property var stateCode: null
}
