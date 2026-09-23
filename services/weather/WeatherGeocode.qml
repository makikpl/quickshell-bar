pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick
import qs.config

Singleton {
    id: root
    property var lat: null
    property var lon: null

    Process {
        id: geo
        command: Settings.stateCode === null
        ? ["curl", "-s", `https://api.openweathermap.org/geo/1.0/direct?q=${Settings.cityName},${Settings.countryCode}&limit=1&appid=${Settings.apiKey}`]
        : ["curl", "-s", `https://api.openweathermap.org/geo/1.0/direct?q=${Settings.cityName},${Settings.stateCode},${Settings.countryCode}&limit=1&appid=${Settings.apiKey}`]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                console.log("g:", text)
                try {
                    const data = JSON.parse(text)
                    if (Array.isArray(data) && data.length > 0) {
                        root.lat = data[0].lat
                        root.lon = data[0].lon
                    }
                }
                catch (e) {
                    console.log("Failed geocoding:", e)
                }
            }
        }
    }

    Timer {
        running: true
        repeat: false
        onTriggered: {
            geo.running = false
            geo.running = true
        }
    }
}
