import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config.colors
import qs.config

Rectangle {
    height: Settings.barHeight
    width: Settings.rModWidth
    color: MatugenColors.boxColor
    border {
        width: Settings.borderWidth
        color: MatugenColors.borderColor
    }
    radius: Settings.roundness
    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        Item {
            id: cpu
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Item {
            id: ram
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Item {
            id: gpu
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Item {
            id: brightness
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Item {
            id: sound
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Item {
            id: net
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Item {
            id: bt
            Layout.fillWidth: true
            Layout.fillHeight: true
            Bluetooth {
                anchors.centerIn: parent
            }
        }
        Item {
            id: power
            Layout.fillWidth: true
            Layout.fillHeight: true
            Battery {
                anchors.centerIn: parent
            }
        }
    }
}
