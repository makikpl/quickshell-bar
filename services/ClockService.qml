pragma Singleton

import Quickshell
import QtQuick

Singleton {
    property alias date: clock.date
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
