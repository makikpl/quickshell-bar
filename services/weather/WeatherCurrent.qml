pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick
import qs.config

Singleton {
    id: root
    property var code: null
    property int temp: 0
    property string unit: !Settings.imperialUnits ? "metric" : "imperial"
    property bool night: false
    property var sunrise: null
    property var sunset: null
    property var geoLat: WeatherGeocode.lat
    property var geoLon: WeatherGeocode.lon
    onGeoLatChanged: {
        if (geoLat !== null) {
            current.running = false
            current.running = true
            timer.running = true
        }
    }

    function weatherIcon(code) {
        if (code >= 200 && code <= 210 || code >= 230 && code <= 232) return "󰙾"
        else if (code > 210 && code <= 221) return "󰖓"
        else if (code >= 300 && code <= 502) return "󰖒"
        else if (code > 502 && code <= 531) return "󰖖"
        else if (code >= 600 && code <= 602 || code >= 620 && code <= 622) return "󰼶"
        else if (code >= 611 && code <= 616) return "󰙿"
        else if (code >= 701 && code <= 771) return "󰖑"
        else if (code === 781) return "󰼸"
        else if (code === 800) return !night ? "󰖙" : "󰖔"
        else if (code > 800 && code < 804) return !night ? "󰖕" : "󰼱"
        else if (code === 804) return !night ? "󰖐" : "󰼱"
        else return "?"
    }

    property string icon: weatherIcon(root.code)

    Process {
        id: current
        command: ["curl", "-s", `https://api.openweathermap.org/data/2.5/weather?lat=${root.geoLat}&lon=${root.geoLon}&appid=${Settings.apiKey}&units=${root.unit}`]
        stdout: StdioCollector {
            onStreamFinished: {
                try {
                    const data = JSON.parse(text)
                    console.log("Weather", text)
                    if (data && data.main) {
                        root.temp = Math.round(data.main.temp)
                        root.code = data.weather[0].id
                        root.sunrise = data.sys.sunrise
                        root.sunset = data.sys.sunset
                        if (root.sunrise <= data.dt  && data.dt < root.sunset) {
                            root.night = false
                        }
                        else {
                            root.night = true
                        }
                    }
                }
                catch (e) {
                    console.log("Weather fetch failed:", e)
                }
            }
        }
    }

    Timer {
        id: timer
        running: false
        repeat: true
        interval: 2 * 60 * 1000
        triggeredOnStart: true
        onTriggered: {
            current.running = false
            current.running = true
        }
    }
}
